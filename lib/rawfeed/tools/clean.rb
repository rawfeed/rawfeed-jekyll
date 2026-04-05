require "open3"

module Rawfeed
  module Tools
    def self.minify
      gem_dir = Gem::Specification.find_by_name("rawfeed-jekyll").gem_dir
      script  = File.join(gem_dir, "tools", "scripts", "clean.mjs")

      system("node", script)
    end
  end
end
