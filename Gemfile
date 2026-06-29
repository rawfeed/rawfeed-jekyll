# frozen_string_literal: true

source "https://rubygems.org"

# Utilities
gem "rubyzip", "~> 2.3"

## [ rawfeed ] Do not modify this block unless you know what you are doing.
if ENV["RAWFEED_DEV_PATH"] && File.directory?(ENV["RAWFEED_DEV_PATH"])
  gem "rawfeed", path: ENV["RAWFEED_DEV_PATH"]
else
  ## --- To update rawfeed-jekyll, simply update the version here ---
  gem "rawfeed", "~> 1.0.3"
end

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

# Development dependencies
group :development, :test do
  gem "rspec", "~> 3.12"
  gem "faraday-retry", "~> 1.0"
end
