require "open3"

module Rawfeed
  module Tools
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
