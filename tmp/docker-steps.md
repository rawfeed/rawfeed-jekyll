# Docker — rawfeed-jekyll

## Build da imagem

```bash
docker build -t rawfeed .
```

## Rodar o servidor

```bash
docker run -p 4000:4000 rawfeed
```

Acessar em http://127.0.0.1:4000.

## Editar arquivos com o VSCode via Docker

### Opção 1 — Montar volume (recomendado)

Monta o diretório do projeto por cima da imagem, permitindo editar no
host e ver as mudanças refletidas no servidor Jekyll em tempo real:

```bash
docker run -p 4000:4000 \
  -v "$PWD:/srv/jekyll" \
  rawfeed
```

> O Jekyll já observa mudanças por padrão (`--watch`). Basta editar
> qualquer arquivo no host que o servidor reinicia automaticamente.

### Opção 2 — Dev Containers (VSCode)

1. Instale a extensão **Dev Containers** (ms-vscode-remote.remote-containers)
2. Pressione `F1` → **Dev Containers: Reopen in Container**
3. Selecione **From Dockerfile**
4. O VSCode vai construir a imagem e abrir o projeto dentro do container

Uma vez dentro do container, abra um terminal no VSCode e rode:

```bash
bundle exec rawfeed serve --host 0.0.0.0
```

Para criar um atalho permanente, crie `.devcontainer/devcontainer.json`:

```json
{
  "name": "rawfeed-jekyll",
  "build": { "dockerfile": "../Dockerfile" },
  "forwardPorts": [4000],
  "customizations": {
    "vscode": {
      "extensions": ["rebornix.ruby", "Shopify.theme-check"]
    }
  }
}
```

## Comandos úteis (execução única)

```bash
# Build do site
docker run --rm -v "$PWD:/srv/jekyll" rawfeed \
  bundle exec rawfeed build

# Backup
docker run --rm -v "$PWD:/srv/jekyll" rawfeed \
  bundle exec rawfeed backup -d /tmp

# Criar um novo site
docker run --rm rawfeed \
  bundle exec rawfeed new /tmp/meu-site

# Abrir um shell interativo
docker run -it --rm -v "$PWD:/srv/jekyll" rawfeed bash
```
