#encoding: utf-8

require "colorize"
require_relative "utils"

module Rawfeed
  class Draft
    def self.draft_create
      array = Rawfeed::Utils.enginer(Rawfeed::CONFIG['DRAFTS_DIR'], 'Enter new draft title:', 'draft')

      puts "Creating new draft: #{array[3]}"

      File.open(array[3], 'w') do |file|
        file.puts("---")
        file.puts("layout: post")
        file.puts("title: \"#{array[0]}\"")
        file.puts("description: \"Description of your post\"")
        file.puts("author: \"Your Name\"")
        file.puts("date: #{array[2]}")
        file.puts("update_date: ")
        file.puts("comments: false")
        file.puts("tags: [tag1, tag2]")
        file.puts("---")
        file.puts("")
        file.puts "<!-- Write from here your post !!! -->"
      end

      puts "Created successfully!"
    end
  end
end
