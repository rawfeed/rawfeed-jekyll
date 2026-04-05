module Rawfeed
  class Installer
    # Caminho para a raiz da gem (se estiver rodando via lib/rawfeed/installer.rb)
    GEM_ROOT = File.expand_path("../..", __dir__)
    TEMPLATE_DIR = File.join(GEM_ROOT, "template")

    def self.create_new_site(path)
      if Dir.exist?(path)
        puts "Directory #{path} already exists!".red
        return
      end

      # Criar diretório do site
      FileUtils.mkdir_p(path)

      # 1. Copiar todo o conteúdo da pasta template
      if Dir.exist?(TEMPLATE_DIR)
        FileUtils.cp_r(Dir["#{TEMPLATE_DIR}/*"], path)
      else
        puts "Error: Template directory not found at #{TEMPLATE_DIR}".red
        return
      end

      # 2. Copiar package.json da raiz da gem (se não existir no template)
      package_src = File.join(GEM_ROOT, "package.json")
      package_dest = File.join(path, "package.json")

      unless File.exist?(package_dest)
        if File.exist?(package_src)
          FileUtils.cp(package_src, package_dest)
        else
          puts "Warning: package.json not found in #{GEM_ROOT}".yellow
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
