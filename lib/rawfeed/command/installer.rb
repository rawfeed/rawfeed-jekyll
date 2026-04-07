require "rawfeed/root"

module Rawfeed
  class Installer
    def self.gem_root
      if defined?(Gem) && Gem.loaded_specs["rawfeed"]
        Gem.loaded_specs["rawfeed"].full_gem_path
      else
        Rawfeed::ROOT
      end
    end

    # Generic function to copy files or folders
    # If dest is a nested directory, it automatically creates the parent directories
    def self.copy_items(items, dest_path)
      items.each do |src, dest_rel|
        dest = File.join(dest_path, dest_rel)

        # Creates parent directory if it doesn't exist.
        FileUtils.mkdir_p(File.dirname(dest))

        if File.exist?(src) || Dir.exist?(src)
          FileUtils.cp_r(src, dest)
        else
          puts "Warning: #{src} not found".yellow
        end
      end
    end

    def self.create_new_site(path)
      if Dir.exist?(path)
        puts "Directory #{path} already exists!".red
        return
      end

      FileUtils.mkdir_p(path)
      gem_dir = gem_root

      # --- files and folders to copy ---
      items_to_copy = [
        [File.join(gem_dir, "_config.yml"), "_config.yml"],
        [File.join(gem_dir, "index.md"), "index.md"],
        [File.join(gem_dir, "404.html"), "404.html"],
        [File.join(gem_dir, ".gitignore"), ".gitignore"],
        [File.join(gem_dir, ".gitlab-ci.yml"), ".gitlab-ci.yml"],
        [File.join(gem_dir, ".editorconfig"), ".editorconfig"],
        [File.join(gem_dir, ".hidden"), ".hidden"],
        [File.join(gem_dir, "robots.tx"), "robots.tx"],

        [File.join(gem_dir, "_data"), "_data"],
        [File.join(gem_dir, "_posts"), "_posts"],
        [File.join(gem_dir, "_pages"), "_pages"],
        [File.join(gem_dir, "_pixels"), "_pixels"],
        [File.join(gem_dir, "blog"), "blog"],
        [File.join(gem_dir, "pixels"), "pixels"],
        [File.join(gem_dir, "assets/images"), "assets/images"]
      ]

      copy_items(items_to_copy, path)

      # --- Gemfile ---
      gemfile_dest = File.join(path, "Gemfile")
      create_gemfile(path) unless File.exist?(gemfile_dest)

      # --- final ---
      puts "New rawfeed site created at #{path}".green
    end

    def self.create_gemfile(path)
      content = <<~GEMFILE
        # frozen_string_literal: true
        source "https://rubygems.org"

        ## Do not modify this block unless you know what you are doing.
        if ENV["RAWFEED_DEV_PATH"] && File.directory?(ENV["RAWFEED_DEV_PATH"])
          gem "rawfeed", path: ENV["RAWFEED_DEV_PATH"]
        else
          ## --- To update rawfeed-jekyll, simply update the version here ---
          gem "rawfeed", "~> #{Rawfeed::VERSION}"
        end

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

        # Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
        # do not have a Java counterpart.
        gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
      GEMFILE

      File.write(File.join(path, "Gemfile"), content)
      puts "Gemfile created at #{path}".green
    end
  end
end
