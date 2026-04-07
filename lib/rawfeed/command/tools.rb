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
      puts "  new <path>        Create a new rawfeed site"
      puts "  install           Install dependencies (Bundle/npm)"
      puts "  create:draft      Create a draft for a post"
      puts "  create:page       Create a page"
      puts "  create:pixel      Create a post for pixel"
      puts "  create:resume     Create the resume page (CV)"
      puts "  post:draft        Opens a selector to move drafts to posting"
      puts "  home:about        Set the home page as the about page"
      puts "  home:blog         Set the home page as the weblog page"
      puts "  blog:disable      Disables the Blog, leaving only the pages"
      puts "  blog:enable       Enable the Blog"
      puts "  pixels:disable    Disables the Pixels, leaving only the pages"
      puts "  pixels:enable     Enable the Pixels"
      puts "  minify            Minify JS, HTML and optimize images"
      puts "  clean --cache     Clean Jekyll cache"
      puts "  clean --all       Clean entire project"
      puts "  help              Show this help message"
      puts "\nFor more info: https://rawfeed.github.io/rawfeed-jekyll".cyan
    end

    def self.install
      puts "Installing Ruby gems...".blue
      system("bundle install")

      puts "Dependencies installed successfully!".green
    end
  end
end

