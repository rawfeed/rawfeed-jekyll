# require "fileutils"
# require "rubygems"

# # overwrite: FORCE=true bundle exec rake theme:install_full

# module Rawfeed
#   class Installer
#     def self.install_template(name = "full", dest = Dir.pwd, force: false)
#       spec = Gem::Specification.find_by_name("rawfeed")
#       theme_path = spec.gem_dir

#       src = File.join(theme_path, "lib", "templates", name)

#       unless Dir.exist?(src)
#         puts "[x] Template '#{name}' not found in #{src}."
#         return
#       end

#       Dir.glob("#{src}/**/*", File::FNM_DOTMATCH).each do |file|
#         next if File.directory?(file)

#         rel_path = file.sub(/^#{Regexp.escape(src)}\//, "")
#         target   = File.join(dest, rel_path)

#         if File.exist?(target) && !force
#           puts "[!] #{rel_path} already exists, not overwriting.".yellow
#         else
#           FileUtils.mkdir_p(File.dirname(target))
#           FileUtils.cp(file, target)
#           # puts "Copied #{rel_path}".green
#         end
#       end

#       # puts "[*] Template '#{name}' installed.".green
#     end
#   end
# end
