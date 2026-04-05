require "open3"

module Rawfeed
  module Tools
    TEMPLATE_DIR = File.expand_path("../../template", __dir__)
    NODE_TOOLS_DIR = File.expand_path("../../tools", __dir__)
    PACKAGE_JSON_PATH = File.expand_path("../../package.json", __dir__)

    def self.new_site(destination)
      raise "Destination path required" if destination.nil? || destination.strip.empty?
      destination = File.expand_path(destination)

      if Dir.exist?(destination) && !Dir.empty?(destination)
        puts "[!] Directory already exists and is not empty: #{destination}".red
        return
      end

      puts "[*] Creating new Rawfeed site at #{destination}..."
      FileUtils.mkdir_p(destination)

      # Copia toda a estrutura do template
      FileUtils.cp_r(Dir.glob("#{TEMPLATE_DIR}/*"), destination)

      # Cria Gemfile
      gemfile_content = <<~GEMFILE
        # frozen_string_literal: true
        source "https://rubygems.org"

        gem "rake", "~> 13.0"
        gem "rawfeed", "~> #{Rawfeed::VERSION}"

        # Windows and JRuby
        platforms :windows, :jruby do
          gem "tzinfo", "~> 1.2"
          gem "tzinfo-data"
        end

        # Windows file watcher
        gem "wdm", "~> 0.1.1", platforms: [:windows]
      GEMFILE

      File.write(File.join(destination, "Gemfile"), gemfile_content)

      # Copia o package.json que já está na gem
      if File.exist?(PACKAGE_JSON_PATH)
        FileUtils.cp(PACKAGE_JSON_PATH, File.join(destination, "package.json"))
      else
        puts "[!] package.json not found in gem!".yellow
      end

      puts "[*] New Rawfeed site created at #{destination}".green
      puts "Next steps:"
      puts "  cd #{destination}"
      puts "  bundle install"
      puts "  npm install"
    end

    def self.install
      # executa npm install na pasta tools interna
      Dir.chdir(NODE_TOOLS_DIR) do
        if !File.exist?("package.json")
          puts "[!] package.json not found in tools!".red
          return
        end
        puts "[*] Installing Node dependencies..."
        system("npm install")
      end
    end

    def self.minify
      gem_dir = Gem::Specification.find_by_name("rawfeed").gem_dir
      script  = File.join(gem_dir, "tools", "scripts", "minify.mjs")

      system("node", script)
    end

    def self.clean(*args)
      gem_dir = Gem::Specification.find_by_name("rawfeed").gem_dir
      script  = File.join(gem_dir, "tools", "scripts", "clean.mjs")

      system("node", script, *args)
    end

    def self.help
      gem_dir = Gem::Specification.find_by_name("rawfeed").gem_dir
      script  = File.join(gem_dir, "tools", "scripts", "help.mjs")

      system("node", script)
    end
  end
end
