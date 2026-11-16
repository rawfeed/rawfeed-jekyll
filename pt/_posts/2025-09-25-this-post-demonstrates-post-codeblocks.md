---
layout: blog/post
title: "Blocos de código - Demonstração no post"
description: "Este post demonstra blocos de código"
author: "William Canin"
date: 2025-09-25 10:36:34 -0300
update_date: 2025-09-28 07:16:01 -0300
comments: true
tags: [example, codeblocks, ruby, html, rust, raw]
toc:
  enable: true
lang: pt
page_id: post-codeblocks
permalink: /blog/this-post-demonstrates-post-codeblocks/
---

> Nota: este post foi criado com o comando: `bundle exec rawfeed create:draft`
> Em seguida, foi publicado com: `bundle exec rawfeed post:draft`

# Blocos de código

Um artigo com vários blocos de trechos de código destacados.

## Código HTML entre crases

```html
<html>
  <head> </head>
  <body>
    <p>Hello, World!</p>
  </body>
</html>
```

## Código Ruby entre crases

```ruby
include Enumerable

module Foo
  class Bar
    LOREM = "lorem ipsum dolor sit"

    attr_reader :layout

    def initialize
      @layout = Layout.new
    end

    # instance method
    def profile
      measure_time do
        compile layout
        layout.render_with Bar::LOREM
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
    <title>Hello World</title>
  </head>
  <body>
    <p>Hello, World!</p>
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
"My Main Tech Stack",
HashMap::from([
("Languages", vec!["Rust", "Python", "Shell Script"]),
("Frontend", vec!["HTML", "CSS", "SASS", "Bootstrap", "Jekyll"]),
("Database", vec!["PostGreSQL", "MySQL"]),
("Tools", vec!["VSCode", "Vim", "JetBrains IDEs", "Git"]),
("OS", vec!["Linux", "Windows"]),
]),
),
]);

let yt_link: &str = "https://www.youtube.com/c/williamcanin";

println!("Hello, World!");
println!("My name is William, and I am a programming and hacking enthusiast.");

for (key, value) in &workflow {
println!("{}:", key);
for (inner_key, inner_value) in value {
println!(" {}: {:?}", inner_key, inner_value);
}
}

println!("YouTube::> {}", yt_link);

}
{% endhighlight %}
