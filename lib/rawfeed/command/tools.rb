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
      puts "  install           Install dependencies (Bundle/npm)".gray
      puts "  minify            Minify JS, HTML and optimize images".gray
      puts "  clean --cache     Clean Jekyll cache".gray
      puts "  clean --all       Clean entire project".gray
      puts "  help              Show this help message".gray
      puts "\nFor more info: https://rawfeed.github.io/rawfeed-jekyll".cyan
    end

    def self.install
      puts "Installing Ruby gems...".blue
      system("bundle install")

      puts "Dependencies installed successfully!".green
    end
  end
end

