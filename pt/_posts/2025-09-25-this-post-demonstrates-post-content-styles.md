---
layout: blog/post
title: "Estilos de conteúdo - Demonstração no post"
description: "Este post demonstra os estilos de conteúdo"
author: "William Canin"
date: 2025-09-22 17:24:04 -0300
update_date: 2025-09-28 07:16:01 -0300
comments: true
tags: [example, style, include, chart]
toc:
  enable: true
lang: pt
page_id: post-content-styles
permalink: /blog/this-post-demonstrates-post-content-styles/
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

# Tabela

| Título 1               | Título 2               | Título 3               | Título 4               |
| --------------------- | --------------------- | --------------------- | --------------------- |
| lorem                 | lorem ipsum           | lorem ipsum dolor     | lorem ipsum dolor sit |
| lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit |
| lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit |
| lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit |

# Exemplo de abas

{% include markdown/tabs %}

tab1: Instalação

O conteúdo da aba pode incluir **Markdown**, imagens, código e outros elementos.

tab2: Configurações

O conteúdo da segunda aba também é renderizado normalmente.

{% include markdown/endtabs %}

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
  color="#3c7052ff"
%}

# Links das redes sociais

{% include markdown/socials pos="center" %}
