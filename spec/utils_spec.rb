# frozen_string_literal: true

require "spec_helper"

RSpec.describe Rawfeed::Utils do
  describe ".slug_generator" do
    it "creates a URL-friendly slug" do
      result = described_class.slug_generator("Hello World! Test")
      expect(result).to eq("hello-world-test")
    end
  end

  describe ".datetime_generator" do
    it "formats the provided date string" do
      ENV["date"] = "2025-11-30"
      result = described_class.datetime_generator("%Y-%m-%d")
      expect(result).to eq("2025-11-30")
    ensure
      ENV.delete("date")
    end
  end

  describe ".create_directory" do
    it "creates a missing directory" do
      Dir.mktmpdir do |tmp_dir|
        path = File.join(tmp_dir, "new-folder")
        expect(File).not_to exist(path)

        described_class.create_directory(path)

        expect(File).to exist(path)
        expect(File).to be_directory(path)
      end
    end
  end
end
