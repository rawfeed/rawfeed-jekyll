module Rawfeed
  class Installer
    GEM_DIR = Gem::Specification.find_by_name("rawfeed").gem_dir
    TEMPLATE_DIR = File.join(GEM_DIR, "template")

    def self.create_new_site(path)
      if Dir.exist?(path)
        puts "Directory #{path} already exists!".red
        return
      end

      FileUtils.mkdir_p(path)
      # Copia template
      FileUtils.cp_r(Dir["#{TEMPLATE_DIR}/*"], path)

      # Copia Gemfile e package.json
      FileUtils.cp(File.join(GEM_DIR, "Gemfile"), File.join(path, "Gemfile"))
      FileUtils.cp(File.join(GEM_DIR, "package.json"), File.join(path, "package.json"))

      puts "New rawfeed site created at #{path}".green
      puts "Run `cd #{path} && bundle install && npm install` to set up dependencies".yellow
    end
  end
end


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
