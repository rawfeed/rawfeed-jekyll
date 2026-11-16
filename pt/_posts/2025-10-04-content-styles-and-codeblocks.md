---
layout: blog/post
title: "Estilos de conteúdo e blocos de código - Demonstração"
description: "Um post de exemplo sobre blocos de código e estilos"
author: "William C. Canin"
date: 2025-10-04 17:09:18 -0300
update_date:
comments: true
tags: [example, codeblocks, style, include, chart, ruby, html, rust, raw]
toc:
  enable: true
lang: pt
page_id: content-styles-and-codeblocks
permalink: /blog/content-styles-and-codeblocks/
---

> Nota: este post foi criado com o comando: `bundle exec rawfeed create:draft`
> Em seguida, foi publicado com: `bundle exec rawfeed post:draft`

# Teologia (h1)

Lorem ipsum dolor sit amet, `consectetur` adipiscing elit. Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt. Vestibulum lacus tortor, ultricies id dignissim ac, bibendum in velit.

## Escatologia

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt. Vestibulum lacus tortor, ultricies id dignissim ac, bibendum in velit.

> Curabitur dignissim accumsan rutrum.

# Animais (h1)

Proin convallis mi ac felis pharetra aliquam. Curabitur [dignissim accumsan](/){:target="\_blank"} rutrum. In arcu magna, aliquet vel pretium et, molestie et arcu.

_Mauris lobortis nulla et felis ullamcorper bibendum._ Phasellus et hendrerit mauris. Proin eget nibh a massa vestibulum pretium. Suspendisse eu nisl a ante aliquet bibendum quis a nunc. Praesent varius interdum vehicula. Aenean risus libero, placerat at vestibulum eget, ultricies eu enim. Praesent nulla tortor, malesuada adipiscing adipiscing sollicitudin, adipiscing eget est.

## Felinos (h2)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. **Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt.** Vestibulum lacus tortor, ultricies id dignissim ac, bibendum in velit.

### Gato (h3)

Proin convallis mi ac felis pharetra aliquam. Curabitur dignissim accumsan rutrum. In arcu magna, aliquet vel pretium et, molestie et arcu. Mauris lobortis nulla et felis ullamcorper bibendum.

Phasellus et hendrerit mauris. Proin eget nibh a massa vestibulum pretium. Suspendisse eu nisl a ante aliquet bibendum quis a nunc.

### Tigre (h3)

Praesent varius interdum vehicula. Aenean risus libero, placerat at vestibulum eget, ultricies eu enim. Praesent nulla tortor, malesuada adipiscing adipiscing sollicitudin, adipiscing eget est.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt.

# Listas

## Lista ordenada

1. Primeiro item
2. Segundo item
3. Terceiro item
4. Quarto item
5. Quinto item, com subitens

## Lista com subitens

- Primeiro item
- Segundo item
- Terceiro item
- Quarto item
- Quinto item, com subitens
  - Subitem um
  - Subitem dois
  - Subitem três

## Uma lista de verificação?

- [ ] Leite
- [x] Biscoitos
  - [x] Chocolate clássico
  - [x] Chocolate com fermentação natural
- [ ] Queijo

# Citações

> citação simples

> > citação dupla

# Separadores de linha

---

---

---

# Escapando caracteres especiais

\*not in italics\*

# Tabela

| Título 1               | Título 2               | Título 3               | Título 4               |
| --------------------- | --------------------- | --------------------- | --------------------- |
| lorem                 | lorem ipsum           | lorem ipsum dolor     | lorem ipsum dolor sit |
| lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit |
| lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit |
| lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit |

# Exemplo de imagens e GIFs

{% include markdown/image
src= "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXNqM21hNWtxeWtkMTh0ajIwc3prYmt3dmV0a3ptY2RyMDJrejlrYiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT9IgG50Fb7Mi0prBC/giphy.gif"
title="Olá!"
caption="GIF animado de exemplo — © Giphy"
width="300"
height="auto"
border-radius="2"
align="left"
border-color="#858585" %}

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt.
_Mauris lobortis nulla et felis ullamcorper bibendum._ Phasellus et hendrerit mauris. Proin eget nibh a massa vestibulum pretium. Suspendisse eu nisl a ante aliquet bibendum quis a nunc. Praesent varius interdum vehicula. Aenean risus libero, placerat at vestibulum eget, ultricies eu enim. Praesent nulla tortor, malesuada adipiscing adipiscing sollicitudin, adipiscing eget est.

{% include markdown/image
src= "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXNqM21hNWtxeWtkMTh0ajIwc3prYmt3dmV0a3ptY2RyMDJrejlrYiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT9IgG50Fb7Mi0prBC/giphy.gif"
title="Olá!"
caption="GIF animado de exemplo — © Giphy"
width="300"
height="auto"
border-radius="2"
align="right" %}

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt.
_Mauris lobortis nulla et felis ullamcorper bibendum._ Phasellus et hendrerit mauris. Proin eget nibh a massa vestibulum pretium. Suspendisse eu nisl a ante aliquet bibendum quis a nunc. Praesent varius interdum vehicula. Aenean risus libero, placerat at vestibulum eget, ultricies eu enim. Praesent nulla tortor, malesuada adipiscing adipiscing sollicitudin, adipiscing eget est.

{% include markdown/image
src= "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXNqM21hNWtxeWtkMTh0ajIwc3prYmt3dmV0a3ptY2RyMDJrejlrYiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT9IgG50Fb7Mi0prBC/giphy.gif"
title="Olá!"
caption="GIF animado de exemplo — © Giphy"
width="100%"
height="auto"
border-radius="2"
align="center"
border-color="#46e038" %}

Praesent varius interdum vehicula. Aenean risus libero, placerat at vestibulum eget, ultricies eu enim. Praesent nulla tortor, malesuada adipiscing adipiscing sollicitudin, adipiscing eget est.

# Vídeo do YouTube

> Nota: copie o link de incorporação do vídeo.

{% include markdown/video title="Vídeo" url="https://www.youtube.com/embed/xHusjrb_34A?si=th-S_gaVdKqtrJjj" %}

# Exemplo de abas

{% include markdown/tabs %}

tab1: Instalação

O conteúdo da aba pode incluir **Markdown**, imagens, código e outros elementos.

tab2: Configurações

O conteúdo da segunda aba também é renderizado normalmente.

{% include markdown/endtabs %}

# Exemplo de detalhes

{% include markdown/details summary="Como instalar" %}

Este conteúdo **expandido** pode conter Markdown, código, listas e outros elementos.

{% include markdown/enddetails %}

# Alertas

## Sucesso

{% include markdown/alert type="success" content="
  Parabéns! Seu tema está funcionando.
"%}

## Perigo

{% include markdown/alert type="danger" content="
  Perigo! Não remova este exemplo.
"%}

## Aviso

{% include markdown/alert type="warning" content="
  Aviso! Este é apenas um exemplo.
"%}

# Exemplo de gráfico

{% include markdown/chart
  type="bar"
  labels="Janeiro,Fevereiro,Março,Abril,Maio"
  data="10,13,20,25,50"
  label="Vendas"
  color="#00bfffff"
%}

# Links das redes sociais

{% include markdown/socials pos="center" %}

# Blocos de código

Um artigo com vários blocos de trechos de código destacados.

## Código HTML entre crases

```html
<html>
  <head> </head>
  <body>
    <p>Olá, mundo!</p>
  </body>
</html>
```

## Código Ruby entre crases

```ruby
include Enumerable

module Foo
  class Bar
    LIPSUM = "lorem ipsum dolor sit"

    attr_reader :layout

    def initialize
      @layout = Layout.new
    end

    # instance method
    def profile
      measure_time do
        compile layout
        layout.render_with Bar::LIPSUM
      end
    rescue ArgumentError
      false
    end
  end
end

# Execute code
Foo::Bar.new.profile
```

## Código Sass entre crases

```sass
@import "base"

.card
  display: inline-block
  margin: 0
  padding: 0

  &:hover
    color: #ab45ef;
```

## Bloco sem processamento

{% raw %}

```liquid
{%- assign foo = page.foo | bar: 'baz' -%}
{{ foo }}
```

{% endraw %}

## HTML com realce de sintaxe e numeração de linhas

{% highlight html linenos %}

<html>
  <head>
    <meta charset="utf-8" />
    <title>Olá, mundo</title>
  </head>
  <body>
    <p>Olá, mundo!</p>
  </body>
</html>
{% endhighlight %}

## Rust com realce, numeração de linhas e linhas marcadas

{% highlight rust linenos mark_lines="1 7 15 32" %}

// main.rs

use std::collections::HashMap;

fn main() {

let workflow: HashMap<&str, HashMap<&str, Vec<&str>>> = HashMap::from([
(
"Minha stack principal",
HashMap::from([
("Linguagens", vec!["Rust", "Python", "Shell Script"]),
("Frontend", vec!["HTML", "CSS", "SASS", "Bootstrap", "Jekyll"]),
("Banco de dados", vec!["PostGreSQL", "MySQL"]),
("Ferramentas", vec!["VSCode", "Vim", "JetBrains IDEs", "Git"]),
("Sistema operacional", vec!["Linux", "Windows"]),
]),
),
]);

let yt_link: &str = "https://www.youtube.com/c/williamcanin";

println!("Olá, mundo!");
println!("Meu nome é William e gosto de programação e hacking.");

for (key, value) in &workflow {
println!("{}:", key);
for (inner_key, inner_value) in value {
println!(" {}: {:?}", inner_key, inner_value);
}
}

println!("YouTube::> {}", yt_link);

}
{% endhighlight %}
