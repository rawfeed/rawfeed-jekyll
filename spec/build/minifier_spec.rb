# frozen_string_literal: true

require "spec_helper"
require "tmpdir"
require "fileutils"

RSpec.describe Rawfeed::Build::Minifier do
  describe ".minify_javascript" do
    it "minifies JavaScript with optional chaining and nullish coalescing" do
      Dir.mktmpdir("rawfeed-minifier") do |directory|
        Dir.chdir(directory) do
          js_directory = File.join("_site", "assets", "js")
          FileUtils.mkdir_p(js_directory)
          source = 'const name = user?.profile?.name ?? "guest";'
          file = File.join(js_directory, "modern.js")
          File.write(file, source)

          expect { described_class.minify_javascript }
            .to output(/JavaScript minified successfully/).to_stdout

          expect(File.read(file)).to include("?.", "??")
        end
      end
    end
  end
end
