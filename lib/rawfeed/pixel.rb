#encoding: utf-8

require "colorize"
require_relative "utils"

module Rawfeed
  class Pixel
    def self.pixel_create
      array = Rawfeed::Utils.enginer(Rawfeed::CONFIG['PIXELS_DIR'], 'Enter new pixel title:', 'pixel')

      puts "Creating new pixel: #{array[3]}"

      File.open(array[3], 'w') do |file|
        file.puts("---")
        file.puts("layout: pixel")
        file.puts("author: # \"Your Name\"")
        file.puts("title: \"#{array[0]}\"")
        file.puts("description: \"Description of your post\"")
        file.puts("image:")
        file.puts("  path: # /assets/images/pixels/example.jpg")
        file.puts("  caption: ")
        file.puts("date: #{array[2]} -0300")
        file.puts("---")
        file.puts("")
        file.puts "<!-- Write from here your post !!! -->"
      end

      puts "Created successfully!"
    end
  end
end

