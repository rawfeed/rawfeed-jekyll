# frozen_string_literal: true

require "jekyll"
require "fileutils"
require "yaml"

module Jekyll
  class AuthorGenerator < Generator
    safe true
    priority :low

    def generate(site)
      generic_yml = File.join(site.source, "_data", "generic.yml")

      unless File.exist?(generic_yml)
        Jekyll.logger.error "[AuthorPlugin]", "File _data/generic.yml not found!"
        return
      end

      generic_data = YAML.load_file(generic_yml)
      author_value = generic_data["author"]

      unless author_value
        Jekyll.logger.warn "[AuthorPlugin]", "Field 'author' not found in generic.yml."
        return
      end

      targets = [
        "index.md",
        "blog/index.md",
        "blog/tags/index.md",
        "pixels/index.md"
      ]

      targets.each do |relative_path|
        abs_path = File.join(site.source, relative_path)
        next unless File.exist?(abs_path)

        content = File.read(abs_path)
        updated = nil

        if content =~ /^author:\s*.+$/
          updated = content.gsub(/^author:\s*.+$/, "author: \"#{author_value}\"")
        elsif content =~ /\A---\s*\n/
          updated = content.sub(/\A(---\s*\n)/, "\\1author: \"#{author_value}\"\n")
        end

        if updated && updated != content
          File.write(abs_path, updated)
          Jekyll.logger.info "[AuthorPlugin]", "Updated #{relative_path} → author: #{author_value}"
        else
          Jekyll.logger.debug "[AuthorPlugin]", "No changes to #{relative_path}"
        end
      end
    rescue StandardError => e
      Jekyll.logger.error "[AuthorPlugin]", "Error: #{e.message}"
    end
  end
end
