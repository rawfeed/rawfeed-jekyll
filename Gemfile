# frozen_string_literal: true

source "https://rubygems.org"

## [ rawfeed ] Do not modify this block unless you know what you are doing.
if ENV["RAWFEED_DEV_PATH"] && File.directory?(ENV["RAWFEED_DEV_PATH"])
  gem "rawfeed", path: ENV["RAWFEED_DEV_PATH"]
else
  ## --- To update rawfeed-jekyll, simply update the version here ---
  gem "rawfeed", "~> 0.4.0"
end

# Core
gem "jekyll", ">= 4.0", "< 5.0"
gem "rake", "~> 13.0"

# Jekyll plugins
gem "jekyll-sitemap", "~> 1.4"
gem "jekyll-feed", "~> 0.17.0"
gem "jekyll-archives", "~> 2.3.0"
gem "jekyll-paginate-v2", "~> 3.0.0"

# Utilities
gem "colorize", "~> 1.1.0"
gem "logger", "~> 1.4"
gem "rubyzip", "~> 2.3"

# Build and minification
gem "uglifier", "~> 4.2.0"

## Place your plugins here.
# group :jekyll_plugins do
# end

# Windows and JRuby
platforms :windows, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Windows file watcher
gem "wdm", "~> 0.1.1", platforms: [:windows]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
