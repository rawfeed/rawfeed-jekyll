# frozen_string_literal: true

require_relative "lib/rawfeed/core/version"

Gem::Specification.new do |spec|
  spec.name          = "rawfeed"
  spec.version       = Rawfeed::VERSION
  spec.authors       = ["William C. Canin"]
  spec.email         = ["hello.williamcanin@gmail.com"]

  spec.summary         = "A multilingual Jekyll theme and Ruby CLI with a configurable TUI"
  spec.description     = "Create Jekyll sites with a configurable terminal-style interface, multilingual Markdown, search, projects, and Ruby CLI tools."
  spec.homepage        = "https://rawfeed.github.io/rawfeed-jekyll"
  spec.license         = "MIT"

  spec.required_ruby_version = ">= 3.0.0"

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
      pt
    ]

  include_files = %w[
      Gemfile
      package.json
      .github/workflows/github-pages.yml.disabled
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

  spec.files = Dir.chdir(__dir__) do
    files = include_dirs.flat_map do |directory|
      Dir.glob(File.join(directory, "**", "*"), File::FNM_DOTMATCH).select { |path| File.file?(path) }
    end
    files.concat(include_files.select { |path| File.file?(path) })
    files.concat(Dir.glob("README.{md,markdown,txt}").select { |path| File.file?(path) })
    files.uniq.sort
  end
  spec.require_paths = ["lib"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["documentation_uri"] = "https://rawfeed.github.io/rawfeed-jekyll/"
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
  spec.add_runtime_dependency "terser", "~> 1.2"

  # Jekyll and related gems are specified in the Gemfile created by the installer.
  # They are only needed when running Jekyll commands (serve, build) on the created site.
  # This keeps `gem install rawfeed` lightweight while ensuring all necessary
  # dependencies are available in the correct bundle context where they're used.

end
