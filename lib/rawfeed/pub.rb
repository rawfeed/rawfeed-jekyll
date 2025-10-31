# pub.rb

module Jekyll
  # Define a página que será gerada dinamicamente para cada diretório
  class DirectoryListingPage < Page
    def initialize(site, base, dir, files_and_dirs)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'
      @layout_name = 'pub.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'pub.html')

      # Define o permalink correto para a página de índice
      # Garante que 'pub/sub/index.html' tenha o permalink '/pub/sub/'
      self.data['permalink'] = "/#{dir}/"

      # Título (opcional, pode ser formatado no layout)
      self.data['title'] = File.basename(dir).capitalize

      # A MÁGICA: Injeta a lista de conteúdo no objeto da página
      self.data['directory_contents'] = files_and_dirs
      self.data['layout'] = 'pub'
    end
  end

  # O gerador que executa o escaneamento recursivo
  class DirectoryListingGenerator < Generator
    safe true
    priority :normal

    # Diretório principal que você deseja listar
    PUB_DIR = 'pub'

    def generate(site)
      # Pega todos os arquivos e diretórios dentro de PUB_DIR
      # Exclui o PUB_DIR raiz em si.
      all_paths = Dir.glob("#{PUB_DIR}/**/{" + '*' + ",.*}")

      # Itera sobre cada item encontrado e agrupa por diretório pai
      directory_map = {}

      all_paths.each do |path|
        # Ignora arquivos/diretórios que o Jekyll já processa ou ignora
        next if path.start_with?('_') || path.start_with?('.')
        next if File.basename(path) == 'index.html'

        # Determina o diretório pai (o que vai ter o index.html gerado)
        parent_dir = File.dirname(path)
        parent_dir = PUB_DIR if parent_dir == '.'

        # Inicializa a lista se for a primeira vez
        directory_map[parent_dir] ||= []

        # Determina o tipo e prepara os dados
        if File.directory?(path)
          # Se for um diretório, adiciona a barra final para URL
          type = 'directory'
          url = "/#{path}/"
          size = ''
          date = File.mtime(path)
          # Adiciona apenas se o diretório não estiver vazio
          directory_map[parent_dir] << {
            'name' => File.basename(path),
            'type' => type,
            'url'  => url,
            'date' => date
          } unless Dir.empty?(path)
        else
          # Se for um arquivo
          type = 'file'
          url = "/#{path}"
          size = File.size(path) # Tamanho em bytes
          date = File.mtime(path)

          # Adiciona o item ao seu diretório pai
          directory_map[parent_dir] << {
            'name' => File.basename(path),
            'type' => type,
            'url'  => url,
            'size' => size,
            'date' => date
          }
        end
      end

      # Cria as páginas de listagem dinamicamente
      directory_map.each do |dir_path, contents|
        # Classifica por tipo (diretórios primeiro), depois por nome
        sorted_contents = contents.sort_by do |item|
          [item['type'] == 'file' ? 1 : 0, item['name'].downcase]
        end

        # Lógica para a entrada de navegação '..'
        parent_url = nil
        parent_name = '../'

        if dir_path == PUB_DIR
          # Caso especial: se estiver na raiz 'pub/', o pai é a raiz do site '/'
          parent_url = '/'
        else
          # Para todos os outros subdiretórios (ex: pub/subpasta)
          parent_dir = File.dirname(dir_path)

          # Garante que 'pub' não se torne '.' e que o URL termine em barra
          if parent_dir == PUB_DIR
            parent_url = "/#{PUB_DIR}/"
          else
            parent_url = "/#{parent_dir}/"
          end
        end

        # Adiciona a entrada de navegação para o diretório pai
        sorted_contents.unshift({
          'name' => parent_name,
          'type' => 'parent',
          'url'  => parent_url
        })

        # # Adiciona a página ".." para navegar de volta, exceto para o pub/ raiz
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

        # Cria a nova página e a adiciona ao site
        page = DirectoryListingPage.new(site, site.source, dir_path, sorted_contents)
        site.pages << page
      end
    end
  end
end
