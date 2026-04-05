require "rubygems"

module Rawfeed
  module Tools
    def self.minify
      gem_dir = Gem::Specification.find_by_name("rawfeed-jekyll").gem_dir
      script  = File.join(gem_dir, "tools", "scripts", "minify.mjs")

      system("node", script)
    end
  end
end
