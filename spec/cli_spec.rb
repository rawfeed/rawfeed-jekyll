# frozen_string_literal: true

require "spec_helper"

RSpec.describe Rawfeed::CLI do
  describe ".run" do
    before do
      stub_const("Rawfeed::Draft", Class.new do
        def self.draft_create; end
      end)

      stub_const("Rawfeed::Page", Class.new do
        def self.page_create; end
      end)

      stub_const("Rawfeed::Pixel", Class.new do
        def self.pixel_create; end
      end)

      stub_const("Rawfeed::Donate", Class.new do
        def self.restore_page; end
      end)

      stub_const("Rawfeed::Contact", Class.new do
        def self.restore_page; end
      end)

      stub_const("Rawfeed::Licenses", Class.new do
        def self.restore_page; end
      end)

      stub_const("Rawfeed::Resume", Class.new do
        def self.restore_page; end
      end)

      stub_const("Rawfeed::PostList", Class.new do
        def self.display; end
      end)

      stub_const("Rawfeed::Post", Class.new do
        def self.post(*); end
      end)
    end

    it "calls help for the help command" do
      expect(Rawfeed::Tools).to receive(:help)
      described_class.run(["help"])
    end

    it "delegates minify to Rawfeed::Tools" do
      expect(Rawfeed::Tools).to receive(:minify)
      described_class.run(["minify"])
    end

    it "delegates clean to Rawfeed::Tools with arguments" do
      expect(Rawfeed::Tools).to receive(:clean).with("--cache")
      described_class.run(["clean", "--cache"])
    end

    it "delegates install to Rawfeed::Tools" do
      expect(Rawfeed::Tools).to receive(:install)
      described_class.run(["install"])
    end

    it "delegates build to Rawfeed::Tools with args" do
      expect(Rawfeed::Tools).to receive(:build).with("--help")
      described_class.run(["build", "--help"])
    end

    it "delegates serve to Rawfeed::Tools with args" do
      expect(Rawfeed::Tools).to receive(:serve).with("--help")
      described_class.run(["serve", "--help"])
    end

    it "delegates backup to Rawfeed::Backup" do
      expect(Rawfeed::Backup).to receive(:site).with("--destination", "tmp")
      described_class.run(["backup", "--destination", "tmp"])
    end

    it "delegates new to Rawfeed::Installer with path and args" do
      expect(Rawfeed::Installer).to receive(:create_new_site).with("my-site", "--force")
      described_class.run(["new", "my-site", "--force"])
    end

    it "delegates create:draft to Rawfeed::Draft" do
      expect(Rawfeed::Draft).to receive(:draft_create)
      described_class.run(["create:draft"])
    end

    it "delegates create:page to Rawfeed::Page" do
      expect(Rawfeed::Page).to receive(:page_create)
      described_class.run(["create:page"])
    end

    it "delegates create:pixel to Rawfeed::Pixel" do
      expect(Rawfeed::Pixel).to receive(:pixel_create)
      described_class.run(["create:pixel"])
    end

    it "delegates restore:donate to Rawfeed::Donate" do
      expect(Rawfeed::Donate).to receive(:restore_page)
      described_class.run(["restore:donate"])
    end

    it "delegates restore:contact to Rawfeed::Contact" do
      expect(Rawfeed::Contact).to receive(:restore_page)
      described_class.run(["restore:contact"])
    end

    it "delegates restore:licenses to Rawfeed::Licenses" do
      expect(Rawfeed::Licenses).to receive(:restore_page)
      described_class.run(["restore:licenses"])
    end

    it "delegates restore:resume to Rawfeed::Resume" do
      expect(Rawfeed::Resume).to receive(:restore_page)
      described_class.run(["restore:resume"])
    end

    it "delegates list:posts to Rawfeed::PostList" do
      expect(Rawfeed::PostList).to receive(:display)
      described_class.run(["list:posts"])
    end

    it "delegates home:about to Rawfeed::Layout" do
      expect(Rawfeed::Layout).to receive(:home_about).with(true)
      described_class.run(["home:about"])
    end

    it "delegates home:blog to Rawfeed::Layout" do
      expect(Rawfeed::Layout).to receive(:home_blog)
      described_class.run(["home:blog"])
    end

    it "delegates post:draft to Rawfeed::Post" do
      expect(Rawfeed::Post).to receive(:post).with(no_args)
      described_class.run(["post:draft"])
    end

    it "delegates blog:enable to Rawfeed::Layout and associated helpers" do
      expect(Rawfeed::Layout).to receive(:blog_index).with(true)
      expect(Rawfeed::Layout).to receive(:tags_index).with(true)
      expect(Rawfeed::Layout).to receive(:change_yml).with("defaults", "published", true, "_posts")
      expect(Rawfeed::Layout).to receive(:change_yml).with("pagination", "enabled", true)

      described_class.run(["blog:enable"])
    end

    it "delegates blog:disable to Rawfeed::Layout and associated helpers" do
      expect(Rawfeed::Layout).to receive(:blog_index).with(false)
      expect(Rawfeed::Layout).to receive(:tags_index).with(false)
      expect(Rawfeed::Layout).to receive(:change_yml).with("defaults", "published", false, "_posts")
      expect(Rawfeed::Layout).to receive(:change_yml).with("pagination", "enabled", false)

      described_class.run(["blog:disable"])
    end

    it "delegates pixels:enable to Rawfeed::Layout" do
      expect(Rawfeed::Layout).to receive(:pixels_index).with(true)
      described_class.run(["pixels:enable"])
    end

    it "delegates pixels:disable to Rawfeed::Layout" do
      expect(Rawfeed::Layout).to receive(:pixels_index).with(false)
      described_class.run(["pixels:disable"])
    end

    it "prints an unknown command message for invalid namespaces" do
      expect { described_class.run(["unknown:task"]) }.not_to raise_error
    end

    it "prints an unknown task message for create:<unknown>" do
      expect { described_class.run(["create:unknown"]) }.to output(/Unknown create task/).to_stdout
    end

    it "prints an unknown task message for restore:<unknown>" do
      expect { described_class.run(["restore:unknown"]) }.to output(/Unknown restore task/).to_stdout
    end

    it "prints an unknown task message for list:<unknown>" do
      expect { described_class.run(["list:unknown"]) }.to output(/Unknown list task/).to_stdout
    end

    it "prints an unknown task message for home:<unknown>" do
      expect { described_class.run(["home:unknown"]) }.to output(/Unknown home task/).to_stdout
    end

    it "prints an unknown task message for post:<unknown>" do
      expect { described_class.run(["post:unknown"]) }.to output(/Unknown post task/).to_stdout
    end

    it "prints an unknown task message for blog:<unknown>" do
      expect { described_class.run(["blog:unknown"]) }.to output(/Unknown blog task/).to_stdout
    end

    it "prints an unknown task message for pixels:<unknown>" do
      expect { described_class.run(["pixels:unknown"]) }.to output(/Unknown pixels task/).to_stdout
    end

    it "exits with status 1 when no arguments are provided" do
      expect { described_class.run([]) }.to raise_error(SystemExit) do |error|
        expect(error.status).to eq(1)
      end
    end
  end
end
