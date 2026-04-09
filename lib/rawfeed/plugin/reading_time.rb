require "jekyll"

module Rawfeed
  module ReadingTimeFilter
    def reading_time(input)
      site = Jekyll.sites.first rescue nil
      # blog_data = site.data['screen', 'blog'] rescue {}
      blog_data = site&.data&.dig("screen", "blog") rescue {}
      words_per_minute = blog_data&.dig("post", "reading_time", "words_per_minute") || 180
      message = blog_data&.dig("post", "reading_time", "message") || ["Read this post in", "Read this post in less than"]
      minutes_text = blog_data&.dig("post", "reading_time", "minutes_label") || ["minute", "minutes"]
      words = input.split.size;
      minutes = ( words / words_per_minute ).floor
      minutes_label = minutes == 1 ? "#{minutes_text[0]}" : "#{minutes_text[1]}"
      minutes > 0 ? "#{message[0]} #{minutes} #{minutes_label}" : "#{message[1]} 1 #{minutes_text[0]}"
    end
  end
end
Liquid::Template.register_filter(Rawfeed::ReadingTimeFilter)
