# frozen_string_literal: true

require "fileutils"
require "pathname"
require "colorize"

module Rawfeed
  class CLI
    def self.run(args)
      if args.empty?
        puts "Use: rawfeed help"
        exit 1
      end

      first_arg = args.shift

      # Internal tools
      if %w[minify clean help new install build serve backup].include?(first_arg)
        case first_arg
        when "minify"
          Rawfeed::Tools.minify
        when "clean"
          Rawfeed::Tools.clean(*args)
        when "help"
          Rawfeed::Tools.help
        when "new"
          site_path = args.first || "my-site"
          Rawfeed::Installer.create_new_site(site_path)
        when "install"
          Rawfeed::Tools.install
        when "build"
          Rawfeed::Tools.build(*args)
        when "serve"
          Rawfeed::Tools.serve(*args)
        when "backup"
          Rawfeed::Backup.site(*args)
        end
        return
      end

      # Separate namespace and task for the main commands.
      namespace, task = first_arg.split(":")

      case namespace
      when "create"
        case task
        when "draft" then Rawfeed::Draft.draft_create(*args)
        when "pixel" then Rawfeed::Pixel.pixel_create(*args)
        when "page"  then Rawfeed::Page.page_create(*args)
        else
          puts "Unknown create task: #{task}"
        end
      when "restore"
        case task
          when "donate" then Rawfeed::Donate.restore_page
          when "contact" then Rawfeed::Contact.restore_page
          when "licenses" then Rawfeed::Licenses.restore_page
          when "resume" then Rawfeed::Resume.restore_page
        else
          puts "Unknown restore task: #{task}"
        end
      when "list"
        case task
        when "posts" then Rawfeed::PostList.display
        else
          puts "Unknown list task: #{task}"
        end
      when "home"
        case task
        when "about" then Rawfeed::Layout.home_about(true)
        when "blog"  then Rawfeed::Layout.home_blog
        else
          puts "Unknown home task: #{task}"
        end
      when "post"
        case task
        when "draft" then Rawfeed::Post.post(*args)
        else
          puts "Unknown post task: #{task}"
        end
      when "blog"
        case task
        when "enable"  then
          Rawfeed::Layout.blog_index(true)
          Rawfeed::Layout.tags_index(true)
          Rawfeed::Layout::change_yml("defaults", "published", true, "_posts")
          Rawfeed::Layout.change_yml("pagination", "enabled", true)
        when "disable" then
          Rawfeed::Layout.blog_index(false)
          Rawfeed::Layout.tags_index(false)
          Rawfeed::Layout::change_yml("defaults", "published", false, "_posts")
          Rawfeed::Layout.change_yml("pagination", "enabled", false)
        else
          puts "Unknown blog task: #{task}"
        end
      when "pixels"
        case task
        when "enable"  then Rawfeed::Layout.pixels_index(true)
        when "disable" then Rawfeed::Layout.pixels_index(false)
        else
          puts "Unknown pixels task: #{task}"
        end
      else
        puts "Unknown namespace or command: #{namespace || first_arg}"
        puts "Use:"
        puts "  rawfeed help"
      end
    end
  end
end
