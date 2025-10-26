# frozen_string_literal: true
require "jekyll"
require "open3"
require "tmpdir"
require "tempfile"
require "fileutils"
require "shellwords"
require "json"

# TODO: Note: A functional module for writing TypeScript with Liquid support. The project currently uses CoffeeScript, so this module is disabled.

# Install: npm install --save-dev typescript
#
# Default tsconfig.json:
# {
#   "compilerOptions": {
#     "target": "es6",
#     "strict": true
#   },
#   "exclude": [
#     "node_modules",
#     ".bundle-cache",
#     "tmp",
#     "tools",
#     "_site",
#   ]
# }

module Jekyll
  class TypeScriptGenerator < Generator
    safe true
    priority :low

    def generate(site)
      Jekyll.logger.info "[PLUGIN TS] Plugin TypeScript carregado!"
      ts_config_path = File.join(site.source, "tsconfig.json")

      unless File.exist?(ts_config_path)
        Jekyll.logger.error "[PLUGIN TS]", "tsconfig.json não encontrado!"
        return
      end

      source_dir = File.join(site.source, "assets", "ts")
      output_dir_source = File.join(site.source, "assets", "js") # escreve no source para ser copiado
      FileUtils.mkdir_p(output_dir_source)

      unless Dir.exist?(source_dir)
        Jekyll.logger.info "[PLUGIN TS] nenhum diretório assets/ts encontrado (procure por #{source_dir})"
        return
      end

      Dir.glob(File.join(source_dir, "**", "*.ts")).each do |ts_file|
        process_ts_file(site, ts_config_path, ts_file, source_dir, output_dir_source)
      end
    end

    private

    def process_ts_file(site, ts_config_path, ts_file, source_dir, output_dir_source)
      rel_path = ts_file.sub(/^#{Regexp.escape(source_dir)}\//, "")
      js_rel = rel_path.sub(/\.ts$/, ".js")
      js_output_path_source = File.join(output_dir_source, js_rel)
      FileUtils.mkdir_p(File.dirname(js_output_path_source))

      Jekyll.logger.info "[PLUGIN TS] processando #{rel_path}"

      raw_content = File.read(ts_file)

      # --- 1) remove front matter do arquivo ORIGINAL (antes do render)
      # isto garante que o bloco ---...--- não chegue ao conteúdo final
      content_without_fm = raw_content.sub(/\A---\s*\n.*?\n---\s*\n/m, "")

      # --- 2) renderiza o Liquid usando o motor do Jekyll (includes, assigns, etc)
      # usamos PageWithoutAFile para obter o contexto completo do site
      liquid_page = Jekyll::PageWithoutAFile.new(site, site.source, File.dirname(ts_file), File.basename(ts_file))
      liquid_page.content = content_without_fm
      # renderiza com o payload do site (disponibiliza includes, site.data, etc)
      liquid_page.render({}, site.site_payload)
      processed_content = liquid_page.output.to_s

      # --- 3) remove qualquer linha que contenha somente '---' (proteção extra)
      # (remove linhas contendo apenas traços e espaços)
      processed_content = processed_content.gsub(/^\s*-{3,}\s*$\r?\n?/, "")

      # também remove possíveis linhas vazias no início
      processed_content = processed_content.sub(/\A\s*\r?\n/, "")

      # debug: mostra as primeiras linhas do que será compilado
      # Jekyll.logger.debug "[PLUGIN TS] preview do conteúdo final:\n#{processed_content.lines.first(12).join}"

      # --- 4) grava o .ts temporário (no tmpdir)
      tmp_dir = Dir.mktmpdir("jekyll_ts_")
      begin
        tmp_ts = File.join(tmp_dir, File.basename(ts_file))

        # 1) remove qualquer front matter inicial
        processed_content = processed_content.sub(/\A\s*---\s*\n?/, "")

        # 2) remove linhas isoladas com apenas ---
        processed_content = processed_content.gsub(/^\s*-{3,}\s*$\r?\n?/, "")

        File.write(tmp_ts, processed_content)
        File.chmod(0644, tmp_ts) rescue nil
        Jekyll.logger.debug "[PLUGIN TS] tmp ts criado em #{tmp_ts}"

        # detecta comando tsc como antes (array de tokens)
        tsc_cmd_tokens = detect_tsc_command_tokens(site.source)
        unless tsc_cmd_tokens
          Jekyll.logger.error "[PLUGIN TS] compilador TypeScript não encontrado. Rode `npm install typescript --save-dev` ou assegure npx/tsc no PATH."
          return
        end

        # monta e executa comando com array (evita problemas de escape)
        ts_config = JSON.parse(File.read(ts_config_path))
        target = ts_config.dig("compilerOptions", "target") || "ES5"
        strict = ts_config.dig("compilerOptions", "strict") || false
        cmd_array = tsc_cmd_tokens + ["--target", "#{target}", "--strict", "#{strict}", "--outFile", js_output_path_source, tmp_ts]
        Jekyll.logger.info "[PLUGIN TS] Running → #{cmd_array.shelljoin}"

        stdout, stderr, status = Open3.capture3(*cmd_array)
        if status.success?
          Jekyll.logger.info "[PLUGIN TS] OK: #{rel_path} -> assets/js/#{js_rel}"
          Jekyll.logger.debug stdout unless stdout.to_s.strip.empty?
        else
          Jekyll.logger.error "[PLUGIN TS] tsc falhou para #{rel_path}:"
          puts stderr.to_s
          puts stdout.to_s unless stdout.to_s.strip.empty?
        end
      ensure
        FileUtils.remove_entry(tmp_dir) if tmp_dir && Dir.exist?(tmp_dir)
      end
    rescue => e
      Jekyll.logger.error "[PLUGIN TS] erro processando #{ts_file}: #{e.class}: #{e.message}"
      puts e.backtrace.join("\n")
    end

    def remove_front_matter(content)
      # remove o bloco YAML inicial (--- ... ---) se existir
      content.sub(/\A---\s*\n.*?\n---\s*\n/m, "")
    end

    def render_liquid(site, content)
      # render no contexto do site para que {{ site.url }} e afins sejam resolvidos
      Liquid::Template.parse(content).render(site.site_payload)
    end

    # Retorna um array de tokens do comando tsc, por exemplo:
    # - ["/path/to/node_modules/.bin/tsc"]
    # - ["/path/to/node_modules/.bin/npx", "tsc"]
    # - ["npx", "tsc"]
    # - ["tsc"]
    def detect_tsc_command_tokens(root)
      local_tsc = File.join(root, "node_modules", ".bin", "tsc")
      return [local_tsc] if File.exist?(local_tsc) && File.executable?(local_tsc)

      npx_local = File.join(root, "node_modules", ".bin", "npx")
      if File.exist?(npx_local) && File.executable?(npx_local)
        return [npx_local, "tsc"]
      end

      # fallback para npx no PATH
      which_npx = `which npx`.strip
      return ["npx", "tsc"] unless which_npx.empty?

      # fallback para tsc global
      which_tsc = `which tsc`.strip
      return ["tsc"] unless which_tsc.empty?

      nil
    end
  end
end
