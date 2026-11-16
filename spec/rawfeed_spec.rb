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

  it "includes localization and starter content in the gem file list" do
    specification = Gem::Specification.load(File.expand_path("../rawfeed.gemspec", __dir__))

    expect(specification.files).to include(
      "lib/rawfeed/plugin/localization.rb",
      "pt/index.md",
      "pt/_posts/2025-09-20-welcome-to-jekyll.md",
      "_data/screen/locales/pt.yml",
      "assets/js/prototype.js",
      "package.json",
      ".github/workflows/github-pages.yml.disabled",
    )
  end
end
