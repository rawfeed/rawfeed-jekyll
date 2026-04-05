# frozen_string_literal: true

require "fileutils"
require "pathname"
require "colorize"

module Rawfeed
  class CLI
    def self.run(args)
      if args.empty?
        puts "Usage: rawfeed <namespace>:<task> [options] or rawfeed <tools_command> [options]"
        exit 1
      end

      first_arg = args.shift
      
      # Ferramentas internas
      if %w[minify clean help new install].include?(first_arg)
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
        end
        return
      end

      # Separar namespace e task para os comandos principais
      namespace, task = first_arg.split(":")

      case namespace
      when "create"
        case task
        when "draft" then Rawfeed::Draft.draft_create(*args)
        when "pixel" then Rawfeed::Pixel.pixel_create(*args)
        when "page"  then Rawfeed::Page.page_create(*args)
        when "resume" then Rawfeed::Resume.resume_create(*args)
        else
          puts "Unknown create task: #{task}"
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
        when "enable"  then Rawfeed::Layout.blog_enable
        when "disable" then Rawfeed::Layout.blog_disable
        else
          puts "Unknown blog task: #{task}"
        end
      when "pixels"
        case task
        when "enable"  then Rawfeed::Layout.pixels_enable
        when "disable" then Rawfeed::Layout.pixels_disable
        else
          puts "Unknown pixels task: #{task}"
        end
      else
        puts "Unknown namespace or command: #{namespace || first_arg}"
        puts "Usage:"
        puts "  rawfeed <namespace>:<task> [options]"
        puts "  rawfeed <tools_command> [minify|clean|help|new|install] [options]"
      end
    end
  end
end
