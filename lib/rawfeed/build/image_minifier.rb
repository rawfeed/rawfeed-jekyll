# frozen_string_literal: true

require "colorize"
require "fileutils"

module Rawfeed
  module Build
    class ImageMinifier
      BUILD_DIR = "_site"
      IMAGE_FORMATS = %w[jpg jpeg png].freeze
      QUALITY_JPEG = 75
      QUALITY_WEBP = 75
      QUALITY_AVIF = 50

      def self.minify_images
        begin
          require "mini_magick"
        rescue LoadError
          # mini_magick is optional, but let user know they need it OR ImageMagick
        end

        # Check if ImageMagick is installed
        begin
          system("identify -version > /dev/null 2>&1")
          unless $?.success?
            raise "ImageMagick not found"
          end
        rescue => e
          puts "[!] Error: ImageMagick is not installed or not found in PATH".red
          puts "".red
          if RUBY_PLATFORM.include?("linux")
            if File.exist?("/etc/arch-release")
              puts "    Arch Linux: sudo pacman -S imagemagick".yellow
            else
              puts "    Ubuntu/Debian: sudo apt-get install imagemagick".yellow
            end
          elsif RUBY_PLATFORM.include?("darwin")
            puts "    macOS: brew install imagemagick".yellow
          elsif RUBY_PLATFORM.include?("mingw") || RUBY_PLATFORM.include?("mswin")
            puts "    Windows: https://imagemagick.org/script/download.php".yellow
          else
            puts "    See: https://imagemagick.org/script/download.php".yellow
          end
          exit 1
        end

        puts "Minifying images...".yellow

        image_files = Dir.glob("#{BUILD_DIR}/assets/images/**/*.{jpg,jpeg,png}", File::FNM_CASEFOLD)

        if image_files.empty?
          puts "No images found.".gray
          return
        end

        puts "Found #{image_files.length} images\n".cyan

        total_before = 0
        total_after = 0
        successful = 0
        failed = 0

        image_files.each do |file|
          begin
            before_size = File.size(file)
            total_before += before_size

            # Get file info
            dir = File.dirname(file)
            basename = File.basename(file, File.extname(file))

            # Process with ImageMagick convert command
            # Use 'magick convert' for ImageMagick 7+, fallback to 'convert' for older versions
            converter = system("magick --version > /dev/null 2>&1") ? "magick convert" : "convert"

            # 1. Compress original to JPEG
            temp_jpeg = "#{file}.temp.jpg"
            cmd_jpeg = "#{converter} '#{file}' -quality #{QUALITY_JPEG} -strip '#{temp_jpeg}' 2>/dev/null"
            system(cmd_jpeg)

            if File.exist?(temp_jpeg) && File.size(temp_jpeg) > 0
              FileUtils.mv(temp_jpeg, file)
              jpeg_size = File.size(file)
              total_after += jpeg_size
              successful += 1

              # Create WebP version
              webp_path = File.join(dir, "#{basename}.webp")
              cmd_webp = "#{converter} '#{file}' -quality #{QUALITY_WEBP} '#{webp_path}' 2>/dev/null"
              system(cmd_webp)

              # Create AVIF version
              avif_path = File.join(dir, "#{basename}.avif")
              cmd_avif = "#{converter} '#{file}' -quality #{QUALITY_AVIF} '#{avif_path}' 2>/dev/null"
              system(cmd_avif)

              # Display progress
              human_before = format_bytes(before_size)
              human_after = format_bytes(jpeg_size)
              puts "  #{green_checkmark} #{file} #{gray("(#{human_before} → #{human_after})")}"
            else
              failed += 1
              FileUtils.rm(temp_jpeg) if File.exist?(temp_jpeg)
              puts "  #{red_x} #{file} #{red("(Failed to convert)")}"
            end
          rescue => e
            failed += 1
            puts "  #{red_x} #{file} #{red("(#{e.message}")}\n"
          end
        end

        # Display summary
        if successful > 0
          saved = total_before - total_after
          human_before = format_bytes(total_before)
          human_after = format_bytes(total_after)
          human_saved = format_bytes(saved)

          puts ""
          puts "Images optimized: #{human_before} → #{human_after} (saved #{human_saved})".bold.green
          puts "  Successful: #{successful}, Failed: #{failed}".cyan if failed > 0
          puts ""
        elsif failed > 0
          puts ""
          puts "No images were processed (#{failed} failed)".red
          puts ""
        end
      end

      private

      def self.format_bytes(bytes)
        if bytes >= 1_000_000
          "#{(bytes.to_f / 1_000_000).round(2)}MB"
        elsif bytes >= 1_000
          "#{(bytes.to_f / 1_000).round(2)}KB"
        else
          "#{bytes}B"
        end
      end

      def self.green_checkmark
        "✔".green
      end

      def self.red_x
        "✗".red
      end

      def self.gray(text)
        text.gray
      end

      def self.red(text)
        text.red
      end
    end
  end
end
