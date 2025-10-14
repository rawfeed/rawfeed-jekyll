#encoding: utf-8

require "colorize"
require_relative "utils"

module Rawfeed
  class Page
    def self.page_create
      array = Rawfeed::Utils.enginer(Rawfeed::CONFIG['PAGES_DIR'], 'Enter new page title:', 'page')
      puts ":: Creating new page: #{array[3]}"

      permalink = array[0].downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

      File.open(array[3], 'w') do |file|
        file.puts("---")
        file.puts("layout: page")
        file.puts("order: #number")
        file.puts("title: \"#{array[0]}\"")
        file.puts("author: \"Your Name\"")
        file.puts("date: #{array[2]} -0300")
        file.puts("update_date: ")
        file.puts("in_menu: true")
        file.puts("reading_time: true")
        file.puts("published: false")
        file.puts("permalink: /#{permalink}/")
        file.puts("---")
        file.puts("")
        file.puts "<!-- Write from here your page !!! -->"
      end

      puts "[*] Created successfully!".green
      puts "[!] Note: Remember to set \"published\" to \"true\" to publish.".yellow
    end
  end
end
