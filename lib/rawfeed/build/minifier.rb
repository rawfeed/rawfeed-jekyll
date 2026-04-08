# frozen_string_literal: true

require "uglifier"
require "colorize"

module Rawfeed
  module Build
    class Minifier
      BUILD_DIR = "_site"

      def self.minify_javascript
        puts "Minifying JavaScript files...".yellow
        js_files = Dir.glob("#{BUILD_DIR}/assets/js/**/*.js")

        if js_files.empty?
          puts "No JavaScript files found."
          return
        end

        begin
          js_files.each do |file|
            content = File.read(file)
            minified = Uglifier.compile(content, harmony: true)
            File.write(file, minified)
          end
          puts "JavaScript minified successfully!".green
        rescue => e
          puts "Error minifying JavaScript: #{e.message}".red
          raise
        end
      end

      def self.minify_html
        puts "Minifying HTML files...".yellow
        html_files = Dir.glob("#{BUILD_DIR}/**/*.html")

        if html_files.empty?
          puts "No HTML files found."
          return
        end

        begin
          html_files.each do |file|
            content = File.read(file)
            # Simple HTML minification: remove comments, collapse whitespace
            minified = content
              .gsub(/<!--.*?-->/m, "")  # Remove comments
              .gsub(/\s+/, " ")         # Collapse whitespace
              .strip
            File.write(file, minified)
          end
          puts "HTML minified successfully!".green
        rescue => e
          puts "Error minifying HTML: #{e.message}".red
          raise
        end
      end

      def self.minify_all
        puts "Starting minify process...".cyan
        begin
          minify_javascript
          minify_html
          puts "\n Minify completed successfully!\n".bold.green
        rescue => e
          puts "\n An error occurred during minify.\n".bold.red
          puts e.message.red
          exit 1
        end
      end
    end
  end
end

