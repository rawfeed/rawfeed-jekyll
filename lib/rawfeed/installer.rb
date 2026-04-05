module Rawfeed
  class Installer
    # Tenta detectar a raiz da gem de forma robusta
    def self.gem_root
      if defined?(Gem) && Gem.loaded_specs["rawfeed"]
        Gem.loaded_specs["rawfeed"].full_gem_path
      else
        # Fallback para o caminho relativo ao arquivo (lib/rawfeed/installer.rb)
        File.expand_path("../../../", __FILE__)
      end
    end

    def self.template_dir
      File.join(gem_root, "template")
    end

    def self.create_new_site(path)
      if Dir.exist?(path)
        puts "Directory #{path} already exists!".red
        return
      end

      # Criar diretório do site
      FileUtils.mkdir_p(path)

      # 1. Copiar todo o conteúdo da pasta template (incluindo arquivos ocultos)
      cur_template_dir = template_dir
      if Dir.exist?(cur_template_dir)
        # O uso do "." no final do caminho de origem instrui o cp_r a copiar o conteúdo,
        # incluindo arquivos ocultos, para o destino.
        FileUtils.cp_r(File.join(cur_template_dir, "."), path)
      else
        puts "Error: Template directory not found at #{cur_template_dir}".red
        return
      end

      # 2. Copiar package.json da raiz da gem (se não existir no template)
      package_src = File.join(gem_root, "package.json")
      package_dest = File.join(path, "package.json")

      unless File.exist?(package_dest)
        if File.exist?(package_src)
          FileUtils.cp(package_src, package_dest)
        else
          puts "Warning: package.json not found in #{gem_root}".yellow
        end
      end

      puts "New rawfeed site created at #{path}".green
      puts "Run:".blue
      puts "  cd #{path}".yellow
      puts "  bundle install".yellow
      puts "  npm install".yellow
    end
  end
end


# require "fileutils"
# require "rubygems"

# # overwrite: FORCE=true bundle exec rake theme:install_full

# module Rawfeed
#   class Installer
#     def self.install_template(name = "full", dest = Dir.pwd, force: false)
#       spec = Gem::Specification.find_by_name("rawfeed")
#       theme_path = spec.gem_dir

#       src = File.join(theme_path, "lib", "templates", name)

#       unless Dir.exist?(src)
#         puts "[x] Template '#{name}' not found in #{src}."
#         return
#       end

#       Dir.glob("#{src}/**/*", File::FNM_DOTMATCH).each do |file|
#         next if File.directory?(file)

#         rel_path = file.sub(/^#{Regexp.escape(src)}\//, "")
#         target   = File.join(dest, rel_path)

#         if File.exist?(target) && !force
#           puts "[!] #{rel_path} already exists, not overwriting.".yellow
#         else
#           FileUtils.mkdir_p(File.dirname(target))
#           FileUtils.cp(file, target)
#           # puts "Copied #{rel_path}".green
#         end
#       end

#       # puts "[*] Template '#{name}' installed.".green
#     end
#   end
# end
