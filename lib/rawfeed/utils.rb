require "colorize"
require "time"

module Rawfeed
  CONFIG = {
    'DRAFTS_DIR' => File.join(".", "_drafts"),
    'POSTS_DIR' => File.join(".", "_posts"),
    'PIXELS_DIR' => File.join(".", "_pixels"),
    'PAGES_DIR' => File.join(".", "_pages"),
    'RESUME_DIR' => File.join(".", "_data"),
    'CONFIG_YML' => File.join(".", "_config.yml"),
    'markdown_extension' => "md"
  }

  class Utils
    def self.create_directory(path)
      unless File.directory?(path)
        FileUtils.mkdir_p(path)
        puts ":: Folder '#{path}', created!".green
      end
    end

    def self.slug_generator(parameter)
      parameter.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.datetime_generator(parameter)
      begin
        (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime(parameter)
      rescue
        puts "[x] Error - date format must be YYYY-MM-DD, please check you typed it correctly!".red
        exit 1
      end
    end

    def self.confirm(message)
      print "#{message} [y/n]: ".blue
      answer = STDIN.gets.chomp.downcase
      until %w[y n].include?(answer)
        print "[!] Please type 'y' or 'n': ".yellow
        answer = STDIN.gets.chomp.downcase
      end
      answer
    end

    def self.enginer(directory, message, type)
      self.create_directory(directory)
      # abort("Rake aborted: #{directory} directory not found.") unless FileTest.directory?(directory)
      begin
        print "#{message}\n> ".blue
        title = STDIN.gets.chomp
      rescue Interrupt
        puts "\n[!] Approached by the user".yellow
        exit!
      end

      slug     = slug_generator(title)
      date     = datetime_generator('%Y-%m-%d')
      datetime = datetime_generator('%Y-%m-%d %R:%S')

      if type == 'page'
        filename = File.join(directory, "#{slug}.#{CONFIG['markdown_extension']}")
      else
        filename = File.join(directory, "#{date}-#{slug}.#{CONFIG['markdown_extension']}")
      end

      if File.exist?(filename)
        answer = confirm("#{filename} already exists. Do you want to overwrite?")
        abort("Action aborted by user!") if answer == 'n'
      end

      [title, date, datetime, filename]
    end
  end
end
