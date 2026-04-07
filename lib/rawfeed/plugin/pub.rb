# pub.rb

module Jekyll
  # Defines the page that will be dynamically generated for each directory.
  class DirectoryListingPage < Page
    def initialize(site, base, dir, files_and_dirs)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'
      @layout_name = 'pub.html'

      self.process(@name)
      theme_layouts = File.join(site.theme.root, "_layouts")
      self.read_yaml(theme_layouts, "pub.html")
      # # Note: This is for _plugins/
      # self.read_yaml(File.join(base, '_layouts'), 'pub.html')

      # Defines the correct permalink for the index page
      # Ensures that 'pub/sub/index.html' has the permalink '/pub/sub/'
      self.data['permalink'] = "/#{dir}/"

      # Title (optional, can be formatted in the layout)
      self.data['title'] = File.basename(dir).capitalize

      # THE MAGIC: Injects the content list into the page object.
      self.data['directory_contents'] = files_and_dirs
      self.data['layout'] = 'pub'
    end
  end

  # The generator that performs the recursive scan.
  class DirectoryListingGenerator < Generator
    safe true
    priority :normal

    # Main directory you want to list
    PUB_DIR = 'pub'

    def generate(site)
      # Extracts all files and directories within PUB_DIR
      # Deletes the root PUB_DIR itself.
      all_paths = Dir.glob("#{PUB_DIR}/**/{" + '*' + ",.*}")

      # Iterates over each item found and groups by parent directory.
      directory_map = {}

      all_paths.each do |path|
        # It ignores files/directories that Jekyll already processes or ignores.
        next if path.start_with?('_') || path.start_with?('.')
        next if File.basename(path) == 'index.html'

        # Specifies the parent directory (the one where the generated index.html file will be located).
        parent_dir = File.dirname(path)
        parent_dir = PUB_DIR if parent_dir == '.'

        # Initialize the list if it's the first time.
        directory_map[parent_dir] ||= []

        # It determines the type and prepares the data.
        if File.directory?(path)
          # If it's a directory, add the trailing slash for URL.
          type = 'directory'
          url = "/#{path}/"
          size = ''
          date = File.mtime(path)
          # It only adds if the directory is not empty.
          directory_map[parent_dir] << {
            'name' => File.basename(path),
            'type' => type,
            'url'  => url,
            'date' => date
          } unless Dir.empty?(path)
        else
          # If it's a file
          type = 'file'
          url = "/#{path}"
          size = File.size(path)
          date = File.mtime(path)

          # Add the item to its parent directory.
          directory_map[parent_dir] << {
            'name' => File.basename(path),
            'type' => type,
            'url'  => url,
            'size' => size,
            'date' => date
          }
        end
      end

      # Creates listing pages dynamically.
      directory_map.each do |dir_path, contents|
        # Sort by type (directories first), then by name.
        sorted_contents = contents.sort_by do |item|
          [item['type'] == 'file' ? 1 : 0, item['name'].downcase]
        end

        # Logic for the navigation input '..'
        parent_url = nil
        parent_name = '../'

        if dir_path == PUB_DIR
          # Special case: if it's in the root 'pub/', the parent is the root of the site '/'.
          parent_url = '/'
        else
          # For all other subdirectories (e.g. pub/subfolder)
          parent_dir = File.dirname(dir_path)

          # Ensures that 'pub' doesn't become '.' and that the URL doesn't end in a slash.
          if parent_dir == PUB_DIR
            parent_url = "/#{PUB_DIR}/"
          else
            parent_url = "/#{parent_dir}/"
          end
        end

        # Adds the navigation entry for the parent directory.
        sorted_contents.unshift({
          'name' => parent_name,
          'type' => 'parent',
          'url'  => parent_url
        })

        # # Adds the ".." page for back navigation, except for the pub/root directory.
        # unless dir_path == PUB_DIR
        #   parent_url = File.dirname(dir_path)
        #   parent_url = '/' if parent_url == '.'
        #   parent_url = "/#{parent_url}/" unless parent_url == '/'

        #   sorted_contents.unshift({
        #     'name' => '../',
        #     'type' => 'parent',
        #     'url'  => parent_url
        #   })
        # end

        # Create the new page and add it to the website.
        page = DirectoryListingPage.new(site, site.source, dir_path, sorted_contents)
        site.pages << page
      end
    end
  end
end
