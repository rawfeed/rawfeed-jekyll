#encoding: utf-8

require "colorize"
require "fileutils"
require "rubygems"
require_relative "utils"

module Rawfeed
  class Resume
    def self.resume_page_create
      Rawfeed::Utils.create_directory(Rawfeed::CONFIG['PAGES_DIR'])
      slug = "resume"
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
        file.puts("layout: resume")
        file.puts("author: # \"Your Name\"")
        file.puts("order: 4")
        file.puts("title: Resume")
        file.puts("published: false")
        file.puts("permalink: /resume/")
        file.puts("---")
        file.puts("")
        file.puts "<!-- There is no need to put anything here -->"
      end

      puts "[*] Created page #{filepath} successfully!".green
      puts "[!] Note: Remember to set \"published\" to \"true\" to publish.".yellow

    end
    def self.resume_create
      self.resume_page_create
      Rawfeed::Utils.create_directory(Rawfeed::CONFIG['RESUME_DIR'])
      spec = Gem::Specification.find_by_name("rawfeed")
      theme_path = spec.gem_dir
      src = File.join(theme_path, "_data", "resume.yml")
      dest = File.join(Dir.pwd, Rawfeed::CONFIG['RESUME_DIR'])

      if File.exist?(File.join(dest, "resume.yml"))
        answer = Rawfeed::Utils.confirm("File #{File.join(dest, "resume.yml")} already exists. Do you want to overwrite?")
        abort("Creation of #{File.join(dest, "resume.yml")} canceled by user!") if answer == 'n'
      end
      FileUtils.cp(src, dest)
      puts "[*] Created #{File.join(dest, "resume.yml")} successfully!".green
      puts "[!] Note: Configure your #{File.join(dest, "resume.yml")} settings".yellow
    end
  end
end
