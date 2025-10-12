#encoding: utf-8

require "colorize"
require_relative "utils"

module Rawfeed
  class Post
    def self.post_move
      drafts = Dir.glob(File.join(Rawfeed::CONFIG['DRAFTS_DIR'], "*.#{Rawfeed::CONFIG['markdown_extension']}"))

      if drafts.empty?
        puts "No files found in #{DRAFTS_DIR}".yellow
        return
      end

      puts "Select the file to move:\n".light_blue

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
end
