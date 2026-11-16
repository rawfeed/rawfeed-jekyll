# frozen_string_literal: true

require "spec_helper"
require "tmpdir"
require "fileutils"

RSpec.describe Rawfeed::Build::Cleaner do
  it "cleans Jekyll cache files without deleting the generated site" do
    Dir.mktmpdir("rawfeed-cleaner") do |directory|
      Dir.chdir(directory) do
        FileUtils.mkdir_p([".jekyll-cache", "_site"])
        FileUtils.touch(".jekyll-metadata")

        described_class.clean_jekyll_cache

        expect(File).not_to exist(".jekyll-metadata")
        expect(Dir).not_to exist(".jekyll-cache")
        expect(Dir).to exist("_site")
      end
    end
  end

  it "cleans cache files and the generated site" do
    Dir.mktmpdir("rawfeed-cleaner") do |directory|
      Dir.chdir(directory) do
        FileUtils.mkdir_p([".jekyll-cache", "_site"])
        FileUtils.touch(".jekyll-metadata")

        described_class.clean_project

        expect(File).not_to exist(".jekyll-metadata")
        expect(Dir).not_to exist(".jekyll-cache")
        expect(Dir).not_to exist("_site")
      end
    end
  end
end
