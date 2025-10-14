# by rawfeed theme

source "https://rubygems.org"

gem "rake", "~> 13.0"
gem "rawfeed", "~> 0.1.4"

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :windows, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:windows]
