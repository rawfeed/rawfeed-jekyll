module Rawfeed
  class Installer
    # Detecta a raiz da gem
    def self.gem_root
      if defined?(Gem) && Gem.loaded_specs["rawfeed"]
        Gem.loaded_specs["rawfeed"].full_gem_path
      else
        File.expand_path("../../../", __FILE__)
      end
    end

    # Cria o Gemfile do site
    def self.create_gemfile(path)
      content = <<~GEMFILE
        # frozen_string_literal: true
        source "https://rubygems.org"

        gem "rawfeed", "~> #{Rawfeed::VERSION}"

        ## Place your plugins here.
        # group :jekyll_plugins do
        # end

        # Windows and JRuby
        platforms :windows, :jruby do
          gem "tzinfo", "~> 1.2"
          gem "tzinfo-data"
        end

        # Windows file watcher
        gem "wdm", "~> 0.1.1", platforms: [:windows]
      GEMFILE

      File.write(File.join(path, "Gemfile"), content)
      puts "Gemfile created at #{path}".green
    end

    # Copia arquivos se eles existirem
    def self.copy_file_if_exists(src, dest, warn_name = nil)
      return if File.exist?(dest)
      if File.exist?(src)
        FileUtils.cp(src, dest)
      else
        puts "Warning: #{warn_name || File.basename(src)} not found in #{gem_root}".yellow
      end
    end

    # Cria um novo site rawfeed
    def self.create_new_site(path)
      if Dir.exist?(path)
        puts "Directory #{path} already exists!".red
        return
      end

      FileUtils.mkdir_p(path)

      # Lista de arquivos e pastas para copiar [source_rel_path, dest_rel_path, warning_name]
      files_to_copy = [
        ["package.json", "package.json"],
        ["_config.yml", "_config.yml"],
        ["index.md", "index.md"],
        ["404.html", "404.html"],
        [".gitignore", ".gitignore"],
        [".gitlab-ci.yml", ".gitlab-ci.yml"],
        [".editorconfig", ".editorconfig"],
        [".hidden", ".hidden"]
      ]

      files_to_copy.each do |src_rel, dest_rel, warn_name|
        copy_file_if_exists(
          File.join(gem_root, src_rel),
          File.join(path, dest_rel),
          warn_name
        )
      end

      # Cria Gemfile se não existir
      create_gemfile(path) unless File.exist?(File.join(path, "Gemfile"))

      puts "New rawfeed site created at #{path}".green

      # Executa bundle install e npm install automaticamente
      Dir.chdir(path) do
        puts "Running 'bundle install'...".blue
        unless system("bundle install")
          puts "[x] bundle install failed. Please check your environment.".red
          return
        end

        puts "Running 'npm install'...".blue
        unless system("npm install")
          puts "[x] npm install failed. Please check your Node.js / npm setup.".red
          return
        end
      end

      puts "[*] Dependencies installed successfully!".green

    end
  end
end
