require "jekyll"

module Rawfeed
  module ReadingTimeFilter
    def reading_time(input)
      site_config = Jekyll.sites.first.config rescue {}
      words_per_minute = site_config&.dig("reading_time", "words_per_minute") || 180
      message = site_config&.dig("reading_time", "message") || ["Read this post in", "Read this post in less than"]
      minutes_text = site_config&.dig("reading_time", "minutes_label") || ["minute", "minutes"]
      words = input.split.size;
      minutes = ( words / words_per_minute ).floor
      minutes_label = minutes == 1 ? "#{minutes_text[0]}" : "#{minutes_text[1]}"
      minutes > 0 ? "#{message[0]} #{minutes} #{minutes_label}" : "#{message[1]} 1 #{minutes_text[0]}"
    end
  end
end
Liquid::Template.register_filter(Rawfeed::ReadingTimeFilter)
