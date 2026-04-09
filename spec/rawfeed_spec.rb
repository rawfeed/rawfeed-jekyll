# frozen_string_literal: true

require "spec_helper"

RSpec.describe Rawfeed do
  it "has a version number" do
    expect(Rawfeed::VERSION).not_to be_nil
    expect(Rawfeed::VERSION).to match(/\d+\.\d+\.\d+/)
  end

  it "loads the library without errors" do
    expect { require "rawfeed" }.not_to raise_error
  end
end
