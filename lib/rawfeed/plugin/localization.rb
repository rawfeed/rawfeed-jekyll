# frozen_string_literal: true

# Recursively overlays locale-specific screen data on top of the default YAML.
# Missing keys continue to use the default-language value.
module Rawfeed
  module Plugin
    module Localization
      NON_LOCALIZED_PATHS = %r{\A/(?:assets/(?:css|js|fonts|vendors)|feed\.xml|sitemap\.xml|robots\.txt)(?:/|\z)}.freeze

      def localize(base, overlay)
        return base if overlay.nil?

        if base.is_a?(Array) && overlay.is_a?(Array)
          result = base.dup
          overlay.each_with_index do |localized, index|
            target = if localized.is_a?(Hash) && localized.key?("slug")
                       result.index { |item| item.is_a?(Hash) && item["slug"] == localized["slug"] }
                     else
                       index
                     end
            if target && target < result.length
              result[target] = localize(result[target], localized)
            else
              result << localized
            end
          end
          return result
        end

        return base unless base.is_a?(Hash) && overlay.is_a?(Hash)

        base.merge(overlay) do |_key, original, localized|
          if (original.is_a?(Hash) && localized.is_a?(Hash)) || (original.is_a?(Array) && localized.is_a?(Array))
            localize(original, localized)
          else
            localized
          end
        end
      end

      def localized_url(input, active_language, default_language, baseurl = "")
        path = input.to_s
        return path if path.empty? || path.match?(%r{\A(?:[a-z][a-z0-9+.-]*:|//|#)}i)

        base = baseurl.to_s.sub(%r{/+\z}, "")
        path = path.delete_prefix(base) unless base.empty?
        path = "/#{path}" unless path.start_with?("/")
        return "#{base}#{path}" if path.match?(NON_LOCALIZED_PATHS)

        language = active_language.to_s
        default = default_language.to_s
        unless language.empty? || language == default
          prefix = "/#{language}"
          path = "#{prefix}#{path}" unless path == prefix || path.start_with?("#{prefix}/")
        end
        "#{base}#{path}"
      end
    end
  end
end

Liquid::Template.register_filter(Rawfeed::Plugin::Localization)
