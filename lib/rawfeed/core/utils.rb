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

  # Utility methods for the Rawfeed framework.
  # Provides helper functionality such as directory creation, slug generation,
  # date formatting, user prompts, and file payload compilation.
  class Utils
    # Safely creates a directory if it does not already exist.
    #
    # @param path [String] The path of the directory to create.
    # @return [void]
    def self.create_directory(path)
      unless File.directory?(path)
        FileUtils.mkdir_p(path)
        puts ":: Folder '#{path}', created!".green
      end
    end

    # Generates a URL-friendly slug from a string.
    # It converts the string to lowercase, strips whitespace, replaces spaces with
    # hyphens, and removes any non-word characters (except hyphens).
    #
    # @param parameter [String] The input string to sluggify.
    # @return [String] The generated slug.
    def self.slug_generator(parameter)
      parameter.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    # Generates a formatted datetime string.
    # Uses the 'date' environment variable if present, otherwise uses the current time.
    #
    # @param parameter [String] The strftime formatting string.
    # @return [String] The formatted time string.
    def self.datetime_generator(parameter)
      (ENV['date'] ? Time.parse(ENV['date']) : Time.now).strftime(parameter)
    rescue ArgumentError
      puts "[x] Error - date format must be YYYY-MM-DD, please check you typed it correctly!".red
      exit 1
    end

    # Prompts the user for a Yes/No confirmation.
    # Forces the user to input 'y' or 'n'.
    #
    # @param message [String] The message to display to the user.
    # @return [String] Returns 'y' or 'n' based on user input.
    def self.confirm(message)
      print "#{message} [y/n]: ".blue
      answer = STDIN.gets.chomp.downcase
      until %w[y n].include?(answer)
        print "[!] Please type 'y' or 'n': ".yellow
        answer = STDIN.gets.chomp.downcase
      end
      answer
    end

    # Scaffolds a new content file (e.g., page, post) by asking the user for a title
    # and generating the required slug and dates.
    #
    # @param directory [String] The directory where the file will be saved.
    # @param message [String] The prompt message to ask the user for a title.
    # @param type [String] The type of content ('page' or other for time-prefixed files).
    # @return [Array<String>] An array containing [title, date, datetime, filename].
    def self.engineer(directory, message, type)
      self.create_directory(directory)
      # abort("Rake aborted: #{directory} directory not found.") unless FileTest.directory?(directory)
      begin
        print "#{message}\n>>> ".blue
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
