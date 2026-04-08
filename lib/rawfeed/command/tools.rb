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
        puts "  --all   → clean full project"
        puts "  --cache → clean only Jekyll cache"
        exit 1
      end
    end

    def self.help
      begin
        puts "rawfeed-jekyll - A minimal, batteries-included Jekyll CMS".bold
        puts "\nUsage: rawfeed <command> [options]".yellow
        puts "\nCommands:".bold
        puts "  new <path>        Create a new rawfeed site"
        puts "                    Use '.' to create in current directory"
        puts "                    Add --force to override non-empty directory"
        puts "  install           Install dependencies (Bundle)"
        puts "  build [OPTIONS]   Build the site"
        puts "  serve [OPTIONS]   Run local development server"
        puts "  minify            Minify JS, HTML and images in _site/"
        puts "                    (requires ImageMagick for image minification)"
        puts "  backup            Create a backup of your site"
        puts "                    Options:"
        puts "                      -d, --destination PATH  Save backup to a specific directory"
        puts "                      -a, --append PATH       Add extra files/folders to backup"
        puts "  clean --cache     Clean Jekyll cache"
        puts "  clean --all       Clean entire project"
        puts "\nContent Generators:".bold
        puts "  create:draft      Create a draft for a post"
        puts "  create:page       Create a page"
        puts "  create:pixel      Create a post for pixel"
        puts "  restore:resume    Restore the resume page (CV)"
        puts "  restore:donate    Restore the donation page"
        puts "  restore:contact   Restore the contact page"
        puts "  restore:licenses  Restore the licenses page"
        puts "  post:draft        Opens a selector to move drafts to posting"
        puts "\nLayout Commands:".bold
        puts "  home:about        Set the home page as the about page"
        puts "  home:blog         Set the home page as the weblog page"
        puts "  blog:enable       Enable the Blog"
        puts "  blog:disable      Disables the Blog, leaving only the pages"
        puts "  pixels:enable     Enable the Pixels"
        puts "  pixels:disable    Disables the Pixels, leaving only the pages"
        puts "\nOptions:".bold
        puts "  For Jekyll build/serve options, run:"
        puts "    rawfeed build --help"
        puts "    rawfeed serve --help"
        puts "\nFor more info: https://rawfeed.github.io/rawfeed-jekyll".cyan
      rescue Interrupt
        puts "\n[!] Approached by the user".yellow
        exit!
      end
    end

    def self.install
      puts "Installing Ruby gems...".blue
      begin
          system("bundle install")
      rescue Interrupt
        puts "\n[!] Approached by the user".yellow
        exit!
      end

      puts "Dependencies installed successfully!".green
    end

    def self.build(*args)
      if args.include?("--help")
        output, = Open3.capture2(*["bundle", "exec", "jekyll", "build", "--help"])
        puts output.gsub(/jekyll/, "rawfeed")
      else
        begin
          cmd = ["bundle", "exec", "jekyll", "build"] + args
          system(*cmd)
        rescue Interrupt
          puts "\n[!] Approached by the user".yellow
          exit!
        end
      end
    end

    def self.serve(*args)
      if args.include?("--help")
        output, = Open3.capture2(*["bundle", "exec", "jekyll", "serve", "--help"])
        puts output.gsub(/jekyll/, "rawfeed")
      else
        begin
          cmd = ["bundle", "exec", "jekyll", "serve"] + args
          system(*cmd)
        rescue Interrupt
          puts "\n[!] Approached by the user".yellow
          exit!
        end
      end
    end
  end
end

