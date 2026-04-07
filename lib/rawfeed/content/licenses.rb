#encoding: utf-8

require "colorize"
require "fileutils"
require "rubygems"
require_relative "../core/utils"

module Rawfeed
  class Licenses
    def self.restore_page
      Rawfeed::Utils.create_directory(Rawfeed::CONFIG['PAGES_DIR'])
      slug = "licenses"
      filepath = File.join(Rawfeed::CONFIG['PAGES_DIR'], "#{slug}.#{CONFIG['markdown_extension']}")

      # capture ctrl+c
      trap("INT") do
        puts "\n[!] Operation canceled by user (Ctrl+C).".yellow
        exit!
      end

      if File.exist?(filepath)
        answer = Rawfeed::Utils.confirm("#{filepath} already exists. Do you want to overwrite?")
        abort("Operation canceled by user.") if answer == 'n'
      end

      File.open(filepath, 'w') do |file|
        file.puts("---")
        file.puts("layout: licenses")
        file.puts("author: # \"Your Name\"")
        file.puts("title: \"Licenses\"")
        file.puts("in_menu: false")
        file.puts("published: false")
        file.puts("toc:")
        file.puts("  enable: false")
        file.puts("permalink: /licenses/")
        file.puts("---")
        file.puts("")
        file.puts "<!-- Implement the license text here. -->"
      end

      puts "[*] Restore licenses #{filepath} successfully!".green
      puts "[!] Note: Remember to set \"published\" to \"true\" to publish.".yellow

    end
  end
end
