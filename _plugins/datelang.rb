# frozen_string_literal: true
require "json"
require "date"

module Jekyll
  module Datelang
    class Main < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super
        @markup = text.strip
      end

      def render(context)
        site = context.registers[:site]
        config = site.config

        # idioma definido no _config.yml
        locale = config.dig("text", "post", "date", "lang") || "en_US"

        # tenta localizar o datelang.json
        json_path = File.join(site.source, "./assets", "json", "datelang.json")

        # se não encontrar, tenta pegar o da gema
        unless File.exist?(json_path)
          json_path = File.expand_path("../../assets/json/datelang.json", __dir__)
        end

        unless File.exist?(json_path)
          return "[datelang error: datelang.json not found]"
        end

        translations = JSON.parse(File.read(json_path))
        data = translations[locale] || translations["en_US"]

        args = parse_args(@markup, context)
        date_input = args[:date]
        format = args[:format] || "%b %-d, %Y"

        return "" unless date_input

        date = parse_date(date_input)
        formatted = date.strftime(format)
        formatted = replace_months(formatted, data)
        formatted
      end

      private

      def parse_args(text, context)
        args = {}
        text.scan(/(\w+):"([^"]+)"|(\S+)/).each do |m|
          if m[0] && m[1]
            args[m[0].to_sym] = m[1]
          elsif m[2]
            args[:date] = Liquid::Template.parse(m[2]).render(context)
          end
        end
        args
      end

      def parse_date(input)
        case input
        when Date then input
        when Time then input.to_date
        else
          Date.parse(input.to_s)
        end
      rescue
        Date.today
      end

      def replace_months(str, data)
        data["months_full"].each_with_index do |m, i|
          next if i.zero?
          str = str.gsub(Date::MONTHNAMES[i], m)
        end
        data["months_short"].each_with_index do |m, i|
          next if i.zero?
          str = str.gsub(Date::ABBR_MONTHNAMES[i], m)
        end
        str
      end
    end
  end
end

Liquid::Template.register_tag("datelang", Jekyll::Datelang::Main)
