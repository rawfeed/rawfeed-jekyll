require "jekyll"
require 'digest'
require 'base64'

# Usage: {{ content | wrap_with_class: 'your-class' }}

module Rawfeed
  module AddClassHtml
    def with_class(input, class_name)
      return input if input.to_s.strip.empty?
      html_output = "<span class=\"#{class_name}\">#{input.to_s}</span>"
      return html_output
    end

    alias_method :add_class_html, :with_class

  end
end

Liquid::Template.register_filter(Rawfeed::AddClassHtml)
