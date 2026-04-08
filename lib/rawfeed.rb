# frozen_string_literal: true
# author: William C. Canin

# Core
require_relative "rawfeed/core/version"
require_relative "rawfeed/core/utils"
require_relative "rawfeed/core/layout"

# Commands
require_relative "rawfeed/command/installer"
require_relative "rawfeed/command/cli"
require_relative "rawfeed/command/backup"

# Lazy load: Content Generators, Jekyll Plugins, and Build tools
# These require Jekyll and are loaded only when Jekyll initializes the theme
require_relative "rawfeed/lazy_loader"

