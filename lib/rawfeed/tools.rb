require "open3"

module Rawfeed
  module Tools
    TEMPLATE_DIR = File.expand_path("../../template", __dir__)
    NODE_TOOLS_DIR = File.expand_path("../../tools", __dir__)

    def self.init(target_dir = Dir.pwd)
      puts "[*] Initializing site in #{target_dir}..."
      FileUtils.mkdir_p(target_dir)
      FileUtils.cp_r(Dir[File.join(TEMPLATE_DIR, "*")], target_dir)
      puts "[*] Site template copied."
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
