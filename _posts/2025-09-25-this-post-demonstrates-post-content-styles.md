---
layout: post
title: "Content styles - Demonstration in the post"
description: "This post demonstrates post content styles"
author: "William Canin"
date: 2025-09-22 17:24:04 -0300
update_date: 2025-09-28 07:16:01 -0300
comments: true
tags: [example,style,include,chart]
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

# Tabs example

{% include tabs %}

tab1: Installation

Tab 1 content — can contain **markdown**, images, code, etc.

tab2: Settings

Tab 2 content — everything is set up normally.

{% include endtabs %}

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
  color="#3c7052ff"
%}

# Socials networks links

{% include socials pos="center" %}
