#encoding: utf-8

require 'yaml'
require "colorize"

module Rawfeed
  class Layout
    CONFIG_PATH = Rawfeed::CONFIG['CONFIG_YML']
    BACKUP_PATH = "_config.yml.bak"

    def self.home_about(verbose)
      file = "index.md"
      content = File.read(file)
      updated = content.gsub(/^layout:\s*\S+$/, "layout: home")
      File.write(file, updated)

      if verbose
        puts "Home page changed to 'about' successfully!".green
      end
    end
    def self.home_blog
      file = "index.md"
      content = File.read(file)
      updated = content.gsub(/^layout:\s*\S+$/, "layout: blog")
      File.write(file, updated)

       puts "Home page changed to 'blog' successfully!".green
    end

    def self.change_yml(section, key, new_value, path_match = nil)
      raise "File #{CONFIG_PATH} not found" unless File.exist?(CONFIG_PATH)

      yaml_value = case new_value
                  when true then "true"
                  when false then "false"
                  else
                    s = new_value.to_s
                    s =~ /\A[-+]?\d+(\.\d+)?\z/ ? s : "\"#{s.gsub('"', '\"')}\""
                  end

      lines = File.readlines(CONFIG_PATH)
      modified = false

      # === CASE 1: defaults → scope.path ===
      if section == "defaults"
        path_indices = lines.each_index.select { |i| lines[i] =~ /^\s*path:\s*["']?#{Regexp.escape(path_match)}["']?/ }
        path_indices.each do |path_i|
          start_i = (0..path_i).to_a.reverse.find { |j| lines[j] =~ /^\s*-\s*scope:/ }
          next unless start_i

          values_i = ((start_i + 1)..[lines.length - 1, start_i + 40].min)
                      .find { |k| lines[k] =~ /^\s*values:\s*$/ }
          next unless values_i

          dash_indent = lines[start_i][/^\s*/].size
          published_i = nil
          m = values_i + 1
          while m < lines.length
            line = lines[m]
            break if line =~ /^\s*-\s*scope:/ && line[/^\s*/].size == dash_indent
            break if line =~ /^\S/ && line[/^\s*/].size <= dash_indent
            if line =~ /^\s*#{key}\s*:/
              published_i = m
              break
            end
            m += 1
          end

          if published_i
            indent = lines[published_i][/^\s*/]
            end_comment = lines[published_i][/#.*/] ? " " + lines[published_i][/#.*/] : ""
            lines[published_i] = "#{indent}#{key}: #{yaml_value}#{end_comment}\n"
            modified = true
          else
            values_indent = lines[values_i][/^\s*/]
            insert_indent = values_indent + "  "
            lines.insert(values_i + 1, "#{insert_indent}#{key}: #{yaml_value}\n")
            modified = true
          end
        end

      # === CASE 2: Simple section, e.g. pagination.enabled ===
      else
        section_i = lines.find_index { |l| l =~ /^#{section}:\s*$/ }
        if section_i
          indent_section = lines[section_i][/^\s*/]
          key_indent = indent_section + "  "
          key_i = nil
          m = section_i + 1
          while m < lines.length
            line = lines[m]
            break if line =~ /^\S/ # new top-level section
            if line =~ /^\s*#{key}\s*:/
              key_i = m
              break
            end
            m += 1
          end

          if key_i
            indent = lines[key_i][/^\s*/]
            end_comment = lines[key_i][/#.*/] ? " " + lines[key_i][/#.*/] : ""
            lines[key_i] = "#{indent}#{key}: #{yaml_value}#{end_comment}\n"
            modified = true
          else
            lines.insert(section_i + 1, "#{key_indent}#{key}: #{yaml_value}\n")
            modified = true
          end
        end
      end

      unless modified
        return { changed: false, message: "Nothing changed (structure not found)" }
      end

      File.write(BACKUP_PATH, File.read(CONFIG_PATH))
      File.open(CONFIG_PATH, "w") { |f| f.write(lines.join) }

      { changed: true, backup: BACKUP_PATH, path: CONFIG_PATH }
    end

    def self.blog_index(value)
      file = "blog/index.md"
      content = File.read(file)
      updated_published = content.gsub(/^published:\s*\S+$/, "published: #{value}")
      updated = updated_published.gsub(/^  enabled:\s*\S+$/, "  enabled: #{value}")
      File.write(file, updated)
    end

    def self.pixels_index(value)
      file = "pixels/index.md"
      content = File.read(file)
      updated = content.gsub(/^published:\s*\S+$/, "published: #{value}")
      File.write(file, updated)
    end

    def self.tags_index(value)
      file = "blog/tags/index.md"
      content = File.read(file)
      updated = content.gsub(/^published:\s*\S+$/, "published: #{value}")
      File.write(file, updated)
    end

  end
end
