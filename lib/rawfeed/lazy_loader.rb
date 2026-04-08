# frozen_string_literal: true

# This lazy loader ensures that Jekyll-dependent code is only loaded when
# Jekyll has initialized. This allows the gem to work with just `colorize`
# as the only gemspec dependency, and Jekyll + plugins are provided by
# the Gemfile created by the installer.

module Rawfeed
  def self.load_jekyll_dependencies
    return if @jekyll_dependencies_loaded

    @jekyll_dependencies_loaded = true

    require_relative "core/version"
    require_relative "core/utils"
    require_relative "core/layout"
    require_relative "build"
    require_relative "command/tools"

    # Content Generators
    require_relative "content/author"
    require_relative "content/draft"
    require_relative "content/page"
    require_relative "content/donate"
    require_relative "content/contact"
    require_relative "content/licenses"
    require_relative "content/pixel"
    require_relative "content/post"
    require_relative "content/resume"

    # Jekyll Plugins
    require_relative "plugin/datelang"
    require_relative "plugin/pub"
    require_relative "plugin/reading_time"
    require_relative "plugin/with_class"
    # require_relative "plugin/csp_filters"
    # require_relative "plugin/typescript_liquid"
  end
end

# Auto-load when Jekyll initializes (when someone requires 'rawfeed' as a theme)
if defined?(Jekyll)
  Rawfeed.load_jekyll_dependencies
end
