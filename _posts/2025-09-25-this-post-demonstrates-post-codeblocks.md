---
layout: blog/post
title: "Codeblocks - Demonstration in the post"
description: "This post demonstrates post codeblock"
author: "William Canin"
date: 2025-09-25 10:36:34 -0300
update_date: 2025-09-28 07:16:01 -0300
comments: true
tags: [example, codeblocks, ruby, html, rust, raw]
toc:
  enable: true
---

> Note: This post create with command: `bundle exec rawfeed create:draft`
> And then using the: `bundle exec rawfeed post:draft`

# Block codes

An article with various blocks of highlighted code snippets.

## HTML code using crasis ` ` `

```html
<html>
  <head> </head>
  <body>
    <p>Hello, World!</p>
  </body>
</html>
```

## Ruby code using crasis ` ` `

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

## Sass code using crasis ` ` `

```sass
@import "base"

.card
  display: inline-block
  margin: 0
  padding: 0

  &:hover
    color: #ab45ef;
```

## Block raw

{% raw %}

```liquid
{%- assign foo = page.foo | bar: 'baz' -%}
{{ foo }}
```

{% endraw %}

## HTML using { % highlight % } with numbers

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

## Rust using { % highlight % } with numbers and marking lines

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
