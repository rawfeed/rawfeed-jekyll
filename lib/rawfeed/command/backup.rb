require "rawfeed/root"
require "fileutils"
require "time"
require "colorize"

module Rawfeed
  class Backup
    DEFAULT_FOLDERS = %w[assets pub .vscode _posts _pages _data].freeze
    STATIC_FILES = %w[_config.yml index.md robots.txt CNAME].freeze
    DYNAMIC_EXTENSIONS = %w[.sh .py .rb .bat .ps1].freeze
    GOOGLE_PATTERN = /^google.*\.html$/.freeze

    def self.site(*args)
      project_root = "."
      gemspec_path = File.join(project_root, "rawfeed.gemspec")

      if File.exist?(gemspec_path)
        puts "[!] Not allowed to create backup from gem source directory (rawfeed.gemspec found)".red
        exit 1
      end

      options = parse_options(args)
      destination = options[:destination] || project_root
      append_paths = options[:append] || []

      unless Dir.exist?(destination)
        puts "[!] Destination directory does not exist: #{destination}".red
        exit 1
      end

      backup_filename = "backup-#{Time.now.strftime('%Y-%m-%d_%H:%M:%S')}.zip"
      backup_path = File.join(destination, backup_filename)

      begin
        create_backup(project_root, backup_path, append_paths)
        puts "[✓] Backup created successfully: #{backup_path}".green
      rescue StandardError => e
        puts "[!] Error creating backup: #{e.message}".red
        exit 1
      end
    end

    private

    def self.parse_options(args)
      options = { destination: nil, append: [] }
      i = 0

      while i < args.length
        case args[i]
        when "--destination", "-d"
          options[:destination] = args[i + 1]
          i += 2
        when "--append", "-a"
          options[:append] << args[i + 1]
          i += 2
        else
          i += 1
        end
      end

      options
    end

    def self.create_backup(project_root, backup_path, append_paths)
      Zip::File.open(backup_path, Zip::File::CREATE) do |zipfile|
        # Add default folders
        DEFAULT_FOLDERS.each do |folder|
          folder_path = File.join(project_root, folder)
          add_folder_to_zip(zipfile, folder_path, folder) if Dir.exist?(folder_path)
        end

        # Add static files
        STATIC_FILES.each do |file|
          file_path = File.join(project_root, file)
          add_file_to_zip(zipfile, file_path, file) if File.exist?(file_path)
        end

        # Add dynamic files
        add_dynamic_files_to_zip(zipfile, project_root)

        # Add append paths
        append_paths.each do |path|
          full_path = File.join(project_root, path)
          if File.directory?(full_path)
            add_folder_to_zip(zipfile, full_path, path)
          elsif File.exist?(full_path)
            add_file_to_zip(zipfile, full_path, path)
          else
            puts "[!] Warning: Path not found: #{path}".yellow
          end
        end
      end
    end

    def self.add_dynamic_files_to_zip(zipfile, project_root)
      Dir.glob(File.join(project_root, "*")).each do |path|
        next unless File.file?(path)

        basename = File.basename(path)
        ext = File.extname(path)

        # Check if it's a dynamic file (has one of the extensions or matches google*.html)
        if DYNAMIC_EXTENSIONS.include?(ext) || GOOGLE_PATTERN.match?(basename)
          add_file_to_zip(zipfile, path, basename)
        end
      end
    end

    def self.add_folder_to_zip(zipfile, folder_path, zip_path)
      Dir.glob(File.join(folder_path, "**/**")).each do |file|
        next if File.directory?(file)

        relative_path = File.join(zip_path, file.sub(folder_path, "").sub(/^\//, ""))
        zipfile.add(relative_path, file)
      end
    end

    def self.add_file_to_zip(zipfile, file_path, zip_path)
      zipfile.add(zip_path, file_path)
    end
  end
end
