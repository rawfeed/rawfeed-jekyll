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
          require "vips"
        rescue LoadError
          puts "[!] Error: ruby-vips gem is required for image minification".red
          puts "    Install it with: gem install ruby-vips".yellow
          puts "    Or add to your Gemfile: gem 'ruby-vips', '~> 2.1'".yellow
          puts "".yellow
          puts "    Note: ruby-vips requires libvips to be installed on your system:".yellow
          puts "      Ubuntu/Debian: sudo apt-get install libvips42".yellow
          puts "      macOS: brew install vips".yellow
          puts "      Windows: https://github.com/libvips/libvips/wiki/Build-for-Windows".yellow
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

        image_files.each do |file|
          begin
            before_size = File.size(file)
            total_before += before_size

            # Load image with vips
            image = Vips::Image.new_from_file(file, access: :sequential)

            # Get file info
            dir = File.dirname(file)
            basename = File.basename(file, File.extname(file))
            ext = File.extname(file).downcase

            # Convert to JPEG (replace original)
            jpeg_buffer = image.jpegsave_buffer(Q: QUALITY_JPEG)
            File.write(file, jpeg_buffer)
            jpeg_size = jpeg_buffer.bytesize
            total_after += jpeg_size

            # Create WebP version
            webp_path = File.join(dir, "#{basename}.webp")
            webp_buffer = image.webpsave_buffer(Q: QUALITY_WEBP)
            File.write(webp_path, webp_buffer)

            # Create AVIF version
            avif_path = File.join(dir, "#{basename}.avif")
            # AVIF options: effort (1-9, default 4), quality (0-100)
            avif_buffer = image.heifsave_buffer(
              codec: :av1,
              effort: 4,
              Q: QUALITY_AVIF
            )
            File.write(avif_path, avif_buffer)

            # Display progress
            human_before = format_bytes(before_size)
            human_after = format_bytes(jpeg_size)
            puts "  #{green_checkmark} #{file} #{gray("(#{human_before} → #{human_after})")}"
          rescue => e
            puts "  ✗ #{file} #{red("Error: #{e.message}")}".red
          end
        end

        # Display summary
        saved = total_before - total_after
        human_before = format_bytes(total_before)
        human_after = format_bytes(total_after)
        human_saved = format_bytes(saved)

        puts ""
        puts "Images optimized: #{human_before} → #{human_after} (saved #{human_saved})".bold.green
        puts ""
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

      def self.gray(text)
        text.gray
      end

      def self.red(text)
        text.red
      end
    end
  end
end
