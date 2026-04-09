# frozen_string_literal: true

require "spec_helper"
require "tmpdir"

RSpec.describe Rawfeed::Backup do
  describe ".site" do
    context "when rawfeed.gemspec is present in the current directory" do
      it "exits with status 1 and prints an error" do
        allow(File).to receive(:exist?).and_call_original
        allow(File).to receive(:exist?).with("./rawfeed.gemspec").and_return(true)

        expect { described_class.site }.to raise_error(SystemExit) do |error|
          expect(error.status).to eq(1)
        end
      end
    end

    context "when destination directory does not exist" do
      it "exits with status 1 and prints an error" do
        allow(File).to receive(:exist?).and_call_original
        allow(File).to receive(:exist?).with("./rawfeed.gemspec").and_return(false)
        allow(Dir).to receive(:exist?).and_call_original
        allow(Dir).to receive(:exist?).with(".").and_return(false)

        expect { described_class.site }.to raise_error(SystemExit) do |error|
          expect(error.status).to eq(1)
        end
      end
    end
  end

  describe ".parse_options (private)" do
    subject { described_class.send(:parse_options, args) }

    context "with --destination flag" do
      let(:args) { ["--destination", "/tmp/backups"] }

      it "parses the destination path" do
        expect(subject[:destination]).to eq("/tmp/backups")
      end
    end

    context "with -d shorthand" do
      let(:args) { ["-d", "/tmp/backups"] }

      it "parses the destination path" do
        expect(subject[:destination]).to eq("/tmp/backups")
      end
    end

    context "with --append flag" do
      let(:args) { ["--append", "extra/folder"] }

      it "collects the path in the append list" do
        expect(subject[:append]).to include("extra/folder")
      end
    end

    context "with no flags" do
      let(:args) { [] }

      it "returns nil destination and empty append list" do
        expect(subject[:destination]).to be_nil
        expect(subject[:append]).to be_empty
      end
    end

    context "with multiple --append flags" do
      let(:args) { ["--append", "dir1", "--append", "dir2"] }

      it "accumulates all append paths" do
        expect(subject[:append]).to eq(["dir1", "dir2"])
      end
    end
  end
end
