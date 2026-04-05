# frozen_string_literal: true

source "https://rubygems.org"

gem "rake", "~> 13.0"
gem "jekyll", "~> 4.0"
gem "colorize", "~> 1.1.0"
gem "logger", "~> 1.4"
gem "rawfeed", path: "."

group :jekyll_plugins do
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-feed", "~> 0.17.0"
  gem "jekyll-archives", "~> 2.3.0"
  gem "jekyll-paginate-v2", "~> 3.0.0"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :windows, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:windows]
