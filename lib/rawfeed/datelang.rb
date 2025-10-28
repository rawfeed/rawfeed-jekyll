# frozen_string_literal: true
require "json"
require "date"
require "jekyll"

module Rawfeed
  module Datelang
    class Main < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super
        @markup = text.strip
      end

      def render(context)
        site = context.registers[:site]
        page = context.registers[:page] || {}
        options = site.data['options']

        locale = options.dig("datelang", "lang") || "en_US"

        json_path = File.join(site.source, "assets", "json", "datelang.json")
        json_path = File.expand_path("../../assets/json/datelang.json", __dir__) unless File.exist?(json_path)

        return "[datelang error: datelang.json not found]" unless File.exist?(json_path)

        translations = JSON.parse(File.read(json_path))
        data = translations[locale] || translations["en_US"]

        args = parse_args(@markup, context)
        date_input = args[:date] || page["date"] || page[:date]
        format = args[:format] || "%b %-d, %Y"

        return "[datelang: no date]" unless date_input && date_input.to_s.strip != ""

        date = parse_date(date_input)
        return "[datelang: invalid date '#{date_input}']" unless date

        formatted = date.strftime(format)

        # Automatically detects month type based on format
        if format.include?("%B")
          replace_months(formatted, data, :full)
        else
          replace_months(formatted, data, :short)
        end
      end

      private

      def parse_args(text, context)
        args = {}

        tokens = text.scan(/"[^"]*"|\S+/).map { |t| t.strip }

        tokens.each do |tok|
          if tok.include?(':')
            key, raw_val = tok.split(':', 2)
            if raw_val.start_with?('"') && raw_val.end_with?('"')
              val = raw_val[1..-2]
            else
              val = Liquid::Template.parse("{{ #{raw_val} }}").render(context).strip
            end
            args[key.to_sym] = val
          else
            rendered = Liquid::Template.parse("{{ #{tok} }}").render(context).strip
            args[:date] = rendered unless rendered.empty?
          end
        end

        args
      end

      def parse_date(input)
        case input
        when Date then input
        when Time then input.to_date
        else
          begin
            Date.parse(input.to_s)
          rescue ArgumentError
            nil
          end
        end
      end

      def replace_months(str, data, type)
        months_key = (type == :full ? "months_full" : "months_short")
        months = data[months_key] || []

        months.each_with_index do |m, i|
          next if i.zero?
          str = str.gsub(Date::MONTHNAMES[i], m)
          str = str.gsub(Date::ABBR_MONTHNAMES[i], m)
        end
        str
      end
    end
  end
end

Liquid::Template.register_tag("datelang", Rawfeed::Datelang::Main)
