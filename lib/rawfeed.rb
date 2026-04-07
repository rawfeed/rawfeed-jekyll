# frozen_string_literal: true
# author: William C. Canin

# Core
require_relative "rawfeed/core/version"
require_relative "rawfeed/core/utils"
require_relative "rawfeed/core/layout"

# Build
require_relative "rawfeed/build"

# Commands
require_relative "rawfeed/command/tools"
require_relative "rawfeed/command/installer"
require_relative "rawfeed/command/cli"
require_relative "rawfeed/command/backup"

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

# Jekyll Plugins
require_relative "rawfeed/plugin/datelang"
require_relative "rawfeed/plugin/pub"
require_relative "rawfeed/plugin/reading_time"
require_relative "rawfeed/plugin/with_class"
# require_relative "rawfeed/plugin/csp_filters"
# require_relative "rawfeed/plugin/typescript_liquid"
