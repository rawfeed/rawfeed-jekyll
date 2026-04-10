# frozen_string_literal: true
# author: William C. Canin

# Core
require_relative "rawfeed/core/version"
require_relative "rawfeed/core/utils"
require_relative "rawfeed/core/layout"
require_relative "rawfeed/build"

# Commands
require_relative "rawfeed/command/installer"
require_relative "rawfeed/command/cli"
require_relative "rawfeed/command/backup"
require_relative "rawfeed/command/tools"

# Content Generators
require_relative "rawfeed/content/author"
require_relative "rawfeed/content/draft"
require_relative "rawfeed/content/page"
require_relative "rawfeed/content/donate"
require_relative "rawfeed/content/contact"
require_relative "rawfeed/content/licenses"
require_relative "rawfeed/content/pixel"
require_relative "rawfeed/content/post"
require_relative "rawfeed/content/resume"

# Jekyll Plugins (optional for CLI-only usage)
begin
  require "jekyll" unless defined?(Jekyll)
rescue LoadError
  # Keep CLI features available even when Jekyll is not installed.
end

if defined?(Jekyll)
  require_relative "rawfeed/plugin/datelang"
  require_relative "rawfeed/plugin/pub"
  require_relative "rawfeed/plugin/reading_time"
  require_relative "rawfeed/plugin/with_class"
end
