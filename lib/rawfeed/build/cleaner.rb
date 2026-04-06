# frozen_string_literal: true

require "fileutils"
require "colorize"

module Rawfeed
  module Build
    class Cleaner
      JEKYLL_CACHE_PATHS = [
        ".jekyll-metadata",
        ".jekyll-cache",
        "_site"
      ].freeze

      PROJECT_PATHS = [
        ".jekyll-metadata",
        ".jekyll-cache",
        "_site"
      ].freeze

      def self.clean_jekyll_cache
        puts "Cleaning Jekyll cache...".yellow
        deleted_paths = []

        JEKYLL_CACHE_PATHS.each do |path|
          if File.exist?(path) || Dir.exist?(path)
            FileUtils.rm_rf(path)
            deleted_paths << path
          end
        end

        if deleted_paths.any?
          puts "Items successfully removed:".green
          deleted_paths.each { |path| puts "  - #{path}".gray }
        else
          puts "No items to clean.".gray
        end
      end

      def self.clean_project
        puts "Cleaning up project directories and files...".yellow
        deleted_paths = []

        PROJECT_PATHS.each do |path|
          if File.exist?(path) || Dir.exist?(path)
            FileUtils.rm_rf(path)
            deleted_paths << path
          end
        end

        if deleted_paths.any?
          puts "Items successfully removed:".green
          deleted_paths.each { |path| puts "  - #{path}".gray }
        else
          puts "No items to clean.".gray
        end
      end
    end
  end
end
