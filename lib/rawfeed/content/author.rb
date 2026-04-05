# frozen_string_literal: true

require "jekyll"
require "fileutils"
require "yaml"

module Jekyll
  class AuthorGenerator < Generator
    safe true
    priority :low

    def generate(site)
      options_yml = File.join(site.source, "_data", "options.yml")

      unless File.exist?(options_yml)
        Jekyll.logger.error "[AuthorPlugin]", "File _data/options.yml not found!"
        return
      end

      options_data = YAML.load_file(options_yml)
      author_value = options_data["author"]

      unless author_value
        Jekyll.logger.warn "[AuthorPlugin]", "Field 'author' not found in options.yml."
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
        elsif content =~ /\A---\s*\n/  # insere logo depois do primeiro ---
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
