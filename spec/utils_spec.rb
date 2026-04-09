# frozen_string_literal: true

require "spec_helper"
require "stringio"

RSpec.describe Rawfeed::Utils do
  describe ".slug_generator" do
    it "creates a URL-friendly slug" do
      result = described_class.slug_generator("Hello World! Test")
      expect(result).to eq("hello-world-test")
    end

    it "handles multiple consecutive spaces" do
      result = described_class.slug_generator("Hello   World")
      expect(result).to eq("hello---world")
    end

    it "removes special characters and punctuation" do
      result = described_class.slug_generator("Title: with, punctuation!")
      expect(result).to eq("title-with-punctuation")
    end

    it "returns an empty string when input is empty" do
      result = described_class.slug_generator("")
      expect(result).to eq("")
    end

    it "preserves hyphens and underscores" do
      result = described_class.slug_generator("my-post_title")
      expect(result).to eq("my-post_title")
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

  describe ".confirm" do
    it "returns the user choice from STDIN" do
      input = StringIO.new("y\n")
      allow(STDIN).to receive(:gets).and_return(input.gets)

      result = described_class.confirm("Continue?")
      expect(result).to eq("y")
    end
  end

  describe ".engineer" do
    it "builds page metadata and filename for a new content item" do
      Dir.mktmpdir do |tmp_dir|
        fake_stdin = StringIO.new("Prototype Title\n")
        allow(STDIN).to receive(:gets).and_return(fake_stdin.gets)
        ENV["date"] = "2025-12-01"

        title, date, datetime, filename = described_class.engineer(tmp_dir, "Title", "post")

        expect(title).to eq("Prototype Title")
        expect(date).to eq("2025-12-01")
        expect(datetime).to match(/2025-12-01 \d{2}:\d{2}:\d{2}/)
        expect(filename).to include("2025-12-01-prototype-title.md")
        expect(File).to exist(File.dirname(filename))
      ensure
        ENV.delete("date")
      end
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
