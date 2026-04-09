# frozen_string_literal: true

require "spec_helper"
require "open3"

RSpec.describe Rawfeed::Tools do
  describe ".help" do
    it "prints the usage information" do
      expect { described_class.help }.not_to raise_error
    end
  end

  describe ".build" do
    it "prints rawfeed build help when --help is provided" do
      allow(Open3).to receive(:capture2)
        .with(*["bundle", "exec", "jekyll", "build", "--help"])
        .and_return(["jekyll build help output", double(success?: true)])

      expect { described_class.build("--help") }
        .to output(/rawfeed build/).to_stdout
    end
  end

  describe ".install" do
    it "invokes bundle install" do
      allow(Kernel).to receive(:system).with("bundle install").and_return(true)

      expect { described_class.install }.not_to raise_error
    end
  end

  describe ".clean" do
    it "cleans Jekyll cache when --cache is passed" do
      expect(Rawfeed::Build::Cleaner).to receive(:clean_jekyll_cache)
      described_class.clean("--cache")
    end

    it "cleans the full project when --all is passed" do
      expect(Rawfeed::Build::Cleaner).to receive(:clean_project)
      described_class.clean("--all")
    end
  end
end
