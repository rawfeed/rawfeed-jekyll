# frozen_string_literal: true

require_relative "lib/rawfeed/version"

Gem::Specification.new do |spec|
  spec.name          = "rawfeed"
  spec.version       = Rawfeed::VERSION
  spec.authors       = ["William C. Canin"]
  spec.email         = ["william.costa.canin@gmail.com"]

  spec.summary       = "A raw Jekyll theme for minimalists"
  spec.homepage      = "https://github.com/williamcanin/rawfeed"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.0.0"

  spec.files = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(lib|assets|_(includes|layouts|sass|data)/|(LICENSE|README)((\.(txt|md|markdown)|$)))!i)
  end
  spec.require_paths = ["lib"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]  = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.add_runtime_dependency "jekyll", ">= 4.0", "< 5.0"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.8.0"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.17.0"
  spec.add_runtime_dependency "jekyll-archives", "~> 2.3.0"
  spec.add_runtime_dependency "jekyll-paginate-v2", "~> 3.0.0"
  spec.add_runtime_dependency "colorize", "~> 1.1.0"
  spec.add_runtime_dependency "logger", "~> 1.4"

end
