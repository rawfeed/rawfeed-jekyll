# frozen_string_literal: true

require "spec_helper"
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
end
