# frozen_string_literal: true

require "bundler/gem_tasks"
require "colorize"
require "rawfeed"

# create
namespace :create do
  desc "Create new draft"
  task :draft do
    Rawfeed::Draft.draft_create
  end

  desc "Create new pixel"
  task :pixel do
    Rawfeed::Pixel.pixel_create
  end

  desc "Create new page"
  task :page do
    Rawfeed::Page.page_create
  end

  desc "Create resume"
  task :resume do
    Rawfeed::Resume.resume_create
  end
end

# home
namespace :home do
  desc "Home page changed to 'about'"
  task :about do
    Rawfeed::Layout.home_about(true)
  end
  desc "Home page changed to 'blog'"
  task :blog do
    Rawfeed::Layout.home_blog
  end
end

# post
namespace :post do
  desc "Move posts"
  task :draft do
    Rawfeed::Post.post
  end
end

# blog
namespace :blog do
  desc "Enable/Disable blog"
  task :disable do
    Rawfeed::Layout.change_yml("defaults", "published", false, "_posts")
    Rawfeed::Layout.change_yml("pagination", "enabled", false)
    Rawfeed::Layout.home_about(false)
    Rawfeed::Layout.blog_index(false)
    Rawfeed::Layout.tags_index(false)
    puts "The blog has been disabled!".green
  end
  task :enable do
    Rawfeed::Layout.change_yml("defaults", "published", true, "_posts")
    Rawfeed::Layout.change_yml("pagination", "enabled", true)
    Rawfeed::Layout.home_about(false)
    Rawfeed::Layout.blog_index(true)
    Rawfeed::Layout.tags_index(true)
    puts "The blog has been enabled!".green
  end
end

# pixels
namespace :pixels do
  desc "Enable/Disable pixels"
  task :disable do
    Rawfeed::Layout.change_yml("defaults", "published", false, "_pixels")
    Rawfeed::Layout.change_yml("pagination", "enabled", false)
    Rawfeed::Layout.pixels_index(false)
    puts "The pixels has been disabled!".green
  end
  task :enable do
    Rawfeed::Layout.change_yml("defaults", "published", true, "_pixels")
    Rawfeed::Layout.change_yml("pagination", "enabled", true)
    Rawfeed::Layout.pixels_index(true)
    puts "The pixels has been enabled!".green
  end
end
