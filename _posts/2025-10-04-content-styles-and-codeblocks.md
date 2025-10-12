---
layout: post
title: "Content styles and Codeblocks - Demonstration in the post"
description: "An example post for: Code Block and Styles"
author: "William C. Canin"
date: 2025-10-04 17:09:18
update_date:
comments: false
tags: [example,codeblocks,style,include,chart,ruby,html,rust,raw]
---

{% include toc selector=".post-content" max_level=3 title="TOC" btn_hidden="Hidden" btn_show="Show" %}

# Theology (h1)

Lorem ipsum dolor sit amet, `consectetur` adipiscing elit. Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt. Vestibulum lacus tortor, ultricies id dignissim ac, bibendum in velit.

## Eschatology

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt. Vestibulum lacus tortor, ultricies id dignissim ac, bibendum in velit.

> Curabitur dignissim accumsan rutrum.

# Animals (h1)

Proin convallis mi ac felis pharetra aliquam. Curabitur [dignissim accumsan](/){:target="\_blank"} rutrum. In arcu magna, aliquet vel pretium et, molestie et arcu.

_Mauris lobortis nulla et felis ullamcorper bibendum._ Phasellus et hendrerit mauris. Proin eget nibh a massa vestibulum pretium. Suspendisse eu nisl a ante aliquet bibendum quis a nunc. Praesent varius interdum vehicula. Aenean risus libero, placerat at vestibulum eget, ultricies eu enim. Praesent nulla tortor, malesuada adipiscing adipiscing sollicitudin, adipiscing eget est.

## Feline (h2)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. **Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt.** Vestibulum lacus tortor, ultricies id dignissim ac, bibendum in velit.

### Cat (h3)

Proin convallis mi ac felis pharetra aliquam. Curabitur dignissim accumsan rutrum. In arcu magna, aliquet vel pretium et, molestie et arcu. Mauris lobortis nulla et felis ullamcorper bibendum.

Phasellus et hendrerit mauris. Proin eget nibh a massa vestibulum pretium. Suspendisse eu nisl a ante aliquet bibendum quis a nunc.

### Tiger (h3)

Praesent varius interdum vehicula. Aenean risus libero, placerat at vestibulum eget, ultricies eu enim. Praesent nulla tortor, malesuada adipiscing adipiscing sollicitudin, adipiscing eget est.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt.

# Lists

## Ordered list

1. First item, yo
2. Second item, dawg
3. Third item, what what?!
4. Fourth item, fo sheezy my neezy
5. Fifth item, nested!

## List with subtitles

- First item, yo
- Second item, dawg
- Third item, what what?!
- Fourth item, fo sheezy my neezy
- Fifth item, nested!
  - So la ti do
  - Ba-da-bing!
  - Ba-da-boom!

## Whaaat, a checklist??

- [ ] Milk
- [x] Cookies
  - [x] Classic Choco-chip
  - [x] Sourdough Choco-chip
- [ ] Chee-ee-eeee-zzze!!!!

# Table

| Title 1               | Title 2               | Title 3               | Title 4               |
| --------------------- | --------------------- | --------------------- | --------------------- |
| lorem                 | lorem ipsum           | lorem ipsum dolor     | lorem ipsum dolor sit |
| lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit |
| lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit |
| lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit | lorem ipsum dolor sit |

# Images or Gifs example

{% include image
src= "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXNqM21hNWtxeWtkMTh0ajIwc3prYmt3dmV0a3ptY2RyMDJrejlrYiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT9IgG50Fb7Mi0prBC/giphy.gif"
title="Hello!"
caption="Example animated GIF — © Giphy"
width="300"
height="auto"
border-radius="2"
align="left"
border-color="#000" %}

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt.
_Mauris lobortis nulla et felis ullamcorper bibendum._ Phasellus et hendrerit mauris. Proin eget nibh a massa vestibulum pretium. Suspendisse eu nisl a ante aliquet bibendum quis a nunc. Praesent varius interdum vehicula. Aenean risus libero, placerat at vestibulum eget, ultricies eu enim. Praesent nulla tortor, malesuada adipiscing adipiscing sollicitudin, adipiscing eget est.

{% include image
src= "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXNqM21hNWtxeWtkMTh0ajIwc3prYmt3dmV0a3ptY2RyMDJrejlrYiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT9IgG50Fb7Mi0prBC/giphy.gif"
title="Hello!"
caption="Example animated GIF — © Giphy"
width="300"
height="auto"
border-radius="2"
align="right"
border-color="#000" %}

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce bibendum neque eget nunc mattis eu sollicitudin enim tincidunt.
_Mauris lobortis nulla et felis ullamcorper bibendum._ Phasellus et hendrerit mauris. Proin eget nibh a massa vestibulum pretium. Suspendisse eu nisl a ante aliquet bibendum quis a nunc. Praesent varius interdum vehicula. Aenean risus libero, placerat at vestibulum eget, ultricies eu enim. Praesent nulla tortor, malesuada adipiscing adipiscing sollicitudin, adipiscing eget est.

{% include image
src= "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMXNqM21hNWtxeWtkMTh0ajIwc3prYmt3dmV0a3ptY2RyMDJrejlrYiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/xT9IgG50Fb7Mi0prBC/giphy.gif"
title="Hello!"
caption="Example animated GIF — © Giphy"
width="100%"
height="auto"
border-radius="2"
align="center"
border-color="#000" %}

Praesent varius interdum vehicula. Aenean risus libero, placerat at vestibulum eget, ultricies eu enim. Praesent nulla tortor, malesuada adipiscing adipiscing sollicitudin, adipiscing eget est.

# Video YouTube

{% include video title="Video" url="https://www.youtube.com/watch?v=IcICF_YF_tI" %}

# Tabs example

{% include tabs %}

tab1: Installation

Tab 1 content — can contain **markdown**, images, code, etc.

tab2: Settings

Tab 2 content — everything is set up normally.

{% include endtabs %}

# Details example

{% include details summary="How install" %}

Here's the **expanded** content — it may have Markdown, code, lists, etc.

{% include enddetails %}

# Alerts

## Success

{% include alert type="success" content="
  Congratulations! Your theme is working.
"%}

## Danger

{% include alert type="danger" content="
  Danger! Do not remove this example
"%}

## Warning

{% include alert type="warning" content="
  Warning! This is just an example
"%}

# Charts example

{% include chart
  type="bar"
  labels="January,February,March,April,May"
  data="10,13,20,25,50"
  label="Sales"
  color="#00bfffff"
%}

# Socials networks links

{% include socials pos="center" %}

# Blockcodes

An article with various blocks of highlighted code snippets.

## HTML code using crase ` ` `

```html
<html>
  <head> </head>
  <body>
    <p>Hello, World!</p>
  </body>
</html>
```

## Ruby code using crase ` ` `

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

## Sass code using crase ` ` `

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
{% assign foo = page.foo | bar: 'baz' %}
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
        println!("  {}: {:?}", inner_key, inner_value);
    }
  }

  println!("YouTube::> {}", yt_link);

}
{% endhighlight %}
