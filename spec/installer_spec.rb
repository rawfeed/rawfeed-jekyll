# frozen_string_literal: true

require "spec_helper"
require "json"
require "tmpdir"

RSpec.describe Rawfeed::Installer do
  describe ".gem_root" do
    it "returns the rawfeed root path" do
      expect(described_class.gem_root).to be_a(String)
      expect(File).to exist(described_class.gem_root)
    end
  end

  describe ".copy_items" do
    it "copies specified files to the destination path" do
      Dir.mktmpdir do |tmp_dir|
        source_dir = File.join(tmp_dir, "source")
        dest_dir = File.join(tmp_dir, "dest")
        FileUtils.mkdir_p(source_dir)
        File.write(File.join(source_dir, "file.txt"), "hello")

        items = [[File.join(source_dir, "file.txt"), "copied/file.txt"]]
        described_class.copy_items(items, dest_dir)

        expect(File).to exist(File.join(dest_dir, "copied", "file.txt"))
        expect(File.read(File.join(dest_dir, "copied", "file.txt"))).to eq("hello")
      end
    end
  end

  describe ".create_new_site" do
    it "copies the localized starter content" do
      Dir.mktmpdir do |tmp_dir|
        destination = File.join(tmp_dir, "new-site")
        described_class.create_new_site(destination)

        expect(File).to exist(File.join(destination, "pt", "index.md"))
        expect(File).to exist(File.join(destination, "pt", "_posts", "2025-09-20-welcome-to-jekyll.md"))
        expect(File).to exist(File.join(destination, "_data", "screen", "locales", "pt.yml"))
        expect(File).to exist(File.join(destination, ".github", "workflows", "github-pages.yml"))
        expect(File).to exist(File.join(destination, "package.json"))
        expect(JSON.parse(File.read(File.join(destination, "package.json"))).dig("scripts", "create:draft"))
          .to eq("bundle exec rawfeed create:draft")
      end
    end
  end
end
