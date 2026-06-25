#encoding: utf-8

require "colorize"
require_relative "../core/utils"

module Rawfeed
  class Post
    def self.post
      drafts = Dir.glob(File.join(Rawfeed::CONFIG['DRAFTS_DIR'], "*.#{Rawfeed::CONFIG['markdown_extension']}"))

      if drafts.empty?
        puts "No files found in #{Rawfeed::CONFIG['DRAFTS_DIR']}".yellow
        return
      end

      puts "Select the file to move:\n".cyan

      drafts.each_with_index do |file, index|
        puts "#{index + 1} - #{File.basename(file)}"
      end
      puts "#{drafts.size + 1} - move all"
      puts "#{drafts.size + 2} - cancel"
      print "\nEnter option number: ".cyan

      # capture ctrl+c
      trap("INT") do
        puts "\n[!] Operation canceled by user (Ctrl+C).".yellow
        exit!
      end

      choice = STDIN.gets.strip.to_i

      if choice == drafts.size + 1
        drafts.each { |file| move_file(file) }
        puts "\n[*] All drafts have been moved to #{Rawfeed::CONFIG['POSTS_DIR']}".green
      elsif choice == drafts.size + 2
        puts "\n[!] Operation canceled by user.".yellow
        exit!
      elsif choice.between?(1, drafts.size)
        move_file(drafts[choice - 1])
      else
        puts "\n[x] Invalid option.".red
      end
    end

    def self.move_file(file)
      filename = File.basename(file)
      destination = File.join(Rawfeed::CONFIG['POSTS_DIR'], filename)

      if File.exist?(destination)
        puts "[!] The file #{filename} already exists in #{Rawfeed::CONFIG['POSTS_DIR']}".yellow
        return
      end

      FileUtils.mv(file, destination)
      puts "[*] #{filename} moved to #{Rawfeed::CONFIG['POSTS_DIR']}".green

    end
  end

  # Post List
  class PostList
    def self.display
      directory_base = Rawfeed::CONFIG['POSTS_DIR']
      posts = Dir.glob(File.join(directory_base, "*.{md,markdown}"))

      # Capture arguments in format --key=value
      args = {}
      parsed_args = ARGV.dup
      parsed_args.each do |arg|
        if arg =~ /--([^=]+)=(.*)/
          args[$1] = $2
        end
      end

      filter_tag  = args['tag'] ? args['tag'].downcase : nil
      filter_date = args['date']

      puts "\n" + "Blog Posts List".bold.blue
      puts "Filters: Tag: #{filter_tag || 'None'} | Date: #{filter_date || 'None'}".cyan
      puts "-" * 90

      posts.sort.reverse_each do |file|
        begin
          content = File.read(file)
          if content =~ /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
            data = YAML.safe_load($1, permitted_classes: [Time, Date])

            title     = data['title'] || "No Title"
            published = data['published'] != false ? "YES".green : "NO".red
            tags      = data['tags'] || []
            date      = data['date'].to_s.split(' ').first || "No Date"

            next if filter_tag && !tags.map(&:downcase).include?(filter_tag)
            next if filter_date && date != filter_date

            tag_list = tags.empty? ? "none" : tags.join(", ")
            printf("%-12s | %-3s | %-30s | %s\n", date.cyan, published, title[0..28].ljust(30), tag_list.magenta)
          end
        rescue => e
          puts "[x] Error reading #{file}: #{e.message}".red
        end
      end
      puts "-" * 90
    end
  end
end
