# frozen_string_literal: true

require_relative "lib/rawfeed/core/version"

Gem::Specification.new do |spec|
  spec.name          = "rawfeed"
  spec.version       = Rawfeed::VERSION
  spec.authors       = ["William C. Canin"]
  spec.email         = ["hello.williamcanin@gmail.com"]

  spec.summary         = "A batteries-included Jekyll framework and CLI"
  spec.homepage        = "https://rawfeed.github.io/rawfeed-jekyll"
  spec.license         = "MIT"

  spec.required_ruby_version = ">= 3.0.0"

  # Note: The files will only be inside the gem after "git commit"
  spec.files = `git ls-files -z`.split("\x0").select do |f|
    # Directories we want to include (everything inside)
    include_dirs = %w[
      lib
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
      Gemfile
      .github/workflows/github-pages.yml
      .gitlab/ci/gitlab-pages.yml
      .editorconfig
      .hidden
      .gitignore
      404.html
      index.md
      _config.yml
      LICENSE
      README
      robots.txt
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

  # Core dependencies for the CLI to work
  spec.add_runtime_dependency "colorize", "~> 1.1.0"

  spec.add_runtime_dependency "jekyll", ">= 4.0", "< 5.0"
  # Jekyll plugins
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.17.0"
  spec.add_runtime_dependency "jekyll-archives", "~> 2.3.0"
  spec.add_runtime_dependency "jekyll-paginate-v2", "~> 3.0.0"

  # utilities
  spec.add_runtime_dependency "logger", "~> 1.4"
  spec.add_runtime_dependency "rubyzip", "~> 2.3"

  # Jekyll and related gems are specified in the Gemfile created by the installer.
  # They are only needed when running Jekyll commands (serve, build) on the created site.
  # This keeps `gem install rawfeed` lightweight while ensuring all necessary
  # dependencies are available in the correct bundle context where they're used.

end
