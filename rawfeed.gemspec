# frozen_string_literal: true

require_relative "lib/rawfeed/version"

Gem::Specification.new do |spec|
  spec.name          = "rawfeed"
  spec.version       = Rawfeed::VERSION
  spec.authors       = ["William C. Canin"]
  spec.email         = ["hello.williamcanin@gmail.com"]

  spec.summary         = "A raw Jekyll theme for minimalists"
  spec.homepage        = "https://rawfeed.github.io/rawfeed-jekyll"
  spec.license         = "MIT"

  spec.required_ruby_version = ">= 3.0.0"

  # Note: The files will only be inside the gem after "git commit"
  spec.files = `git ls-files -z`.split("\x0").select do |f|
    # Directories we want to include (everything inside)
    include_dirs = %w[
      lib
      tools
      exe
      assets
      template
      blog
      pixels
      _includes
      _layouts
      _sass
      _data
      _pixels
      _pages
      _posts
    ]

    # Specific files we want to include
    include_files = %w[
      package.json
      404.html
      index.md
      config.yml
      LICENSE
      README
    ]

    # Checks if it starts with any directory
    matches_dir = include_dirs.any? { |d| f.start_with?("#{d}/") }

    # Checks if it is a specific file (we can accept optional extension)
    matches_file = include_files.any? do |file|
      f == file || f =~ /^#{Regexp.escape(file)}\.(txt|md|markdown)$/i
    end

    matches_dir || matches_file
  end
  spec.require_paths = ["lib"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]  = "https://rawfeed.github.io/rawfeed-jekyll/changelog/"

  # Executables
  spec.executables = ["rawfeed"]
  spec.bindir = "exe"

  spec.add_runtime_dependency "rake", "~> 13.0"
  spec.add_runtime_dependency "jekyll", ">= 4.0", "< 5.0"

  # Jekyll plugins
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.17.0"
  spec.add_runtime_dependency "jekyll-archives", "~> 2.3.0"
  spec.add_runtime_dependency "jekyll-paginate-v2", "~> 3.0.0"

  # utilities
  spec.add_runtime_dependency "colorize", "~> 1.1.0"
  spec.add_runtime_dependency "logger", "~> 1.4"

end
