# frozen_string_literal: true

require "spec_helper"

RSpec.describe Rawfeed::CLI do
  describe ".run" do
    it "calls help for the help command" do
      expect(Rawfeed::Tools).to receive(:help)
      described_class.run(["help"])
    end

    it "prints an unknown command message for invalid namespaces" do
      expect { described_class.run(["unknown:task"]) }.not_to raise_error
    end

    it "exits with status 1 when no arguments are provided" do
      expect { described_class.run([]) }.to raise_error(SystemExit) do |error|
        expect(error.status).to eq(1)
      end
    end
  end
end
