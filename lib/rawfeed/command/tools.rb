require "open3"
require_relative "../build"

module Rawfeed
  module Tools
    def self.minify
      Rawfeed::Build::Minifier.minify_all
    end

    def self.clean(*args)
      if args.include?("--cache")
        Rawfeed::Build::Cleaner.clean_jekyll_cache
      elsif args.include?("--all")
        Rawfeed::Build::Cleaner.clean_project
      else
        puts "Missing argument.".red
        puts "Use one of:".yellow
        puts "  --all   → clean full project".gray
        puts "  --cache → clean only Jekyll cache".gray
        exit 1
      end
    end

    def self.help
      puts "rawfeed - A raw Jekyll theme for minimalists".bold
      puts "\nUsage: rawfeed <command> [options]".yellow
      puts "\nCommands:".bold
      puts "  new <path>        Create a new rawfeed site".gray
      puts "  install           Install dependencies (Bundle)".gray
      puts "  build [OPTIONS]   Build the site".gray
      puts "  serve [OPTIONS]   Run local development server".gray
      puts "  minify            Minify JS and HTML in _site/".gray
      puts "  clean --cache     Clean Jekyll cache".gray
      puts "  clean --all       Clean entire project".gray
      puts "\nContent Generators:".bold
      puts "  create:draft      Create a draft for a post".gray
      puts "  create:page       Create a page".gray
      puts "  create:pixel      Create a post for pixel".gray
      puts "  create:resume     Create the resume page (CV)".gray
      puts "  post:draft        Opens a selector to move drafts to posting".gray
      puts "\nLayout Commands:".bold
      puts "  home:about        Set the home page as the about page".gray
      puts "  home:blog         Set the home page as the weblog page".gray
      puts "  blog:enable       Enable the Blog".gray
      puts "  blog:disable      Disables the Blog, leaving only the pages".gray
      puts "  pixels:enable     Enable the Pixels".gray
      puts "  pixels:disable    Disables the Pixels, leaving only the pages".gray
      puts "\nOptions:".bold
      puts "  For Jekyll build/serve options, run:".gray
      puts "    rawfeed build --help".gray
      puts "    rawfeed serve --help".gray
      puts "\nFor more info: https://rawfeed.github.io/rawfeed-jekyll".cyan
    end

    def self.install
      puts "Installing Ruby gems...".blue
      system("bundle install")

      puts "Dependencies installed successfully!".green
    end

    def self.build(*args)
      puts "Building Jekyll site...".blue
      cmd = ["bundle", "exec", "jekyll", "build"] + args
      system(*cmd)
    end

    def self.serve(*args)
      puts "Starting Jekyll development server...".blue
      cmd = ["bundle", "exec", "jekyll", "serve"] + args
      system(*cmd)
    end
  end
end

