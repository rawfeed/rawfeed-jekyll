<p align="center">
  <img src=".github/logo.png" alt="Rawfeed" width="150">
  <br>
  <small>Rawfeed — A raw Jekyll theme for minimalists</small>
  <br>
  <a href="https://badge.fury.io/rb/rawfeed"><img src="https://badge.fury.io/rb/rawfeed.svg?icon=si%3Arubygems" alt="Gem Version" height="18"></a>
  <br>
  <a href="https://williamcanin.github.io/rawfeed" target="_blank">Theme Preview</a>
</p>

# Requirements

| Required | Version | How to verify | How to install                    |
| -------- | ------- | ------------- | --------------------------------- |
| Git      | >= 2    | `git -v`      | [Git](http://git-scm.com/)        |
| Ruby     | >= 3.0  | `ruby -v`     | [Ruby](https://www.ruby-lang.org) |
| Gem      | >= 3.0  | `gem -v`      | **Ruby** contains **Gem**         |
| Bundler  | >= 2.0  | `bundler -v`  | `gem install bundler`             |
| NodeJs   | >= 20   | `node -v`     | [NodeJS](https://nodejs.org)      |
| Npm      | >= 9    | `npm -v`      | **NodeJS** contains **Npm**       |

# Features

- [x] One-command installation (via Unix|PowerShell);
- [x] A terminal emulator on the home page with commands;
- [x] Commands for manipulating page headers, posts and drafts in markdown;
- [x] Smart floating TOC in posts;
- [x] Theme change: light/dark;
- [x] Chart in posts;
- [x] Stylized Markdown;
- [x] Avatar opens in modal with inversion animation for each different theme (light/dark);
- [x] Enables and Disables weblog;
- [x] Home page with about or blog, you decide with one command;
- [x] A quick search field on the weblog using keyword and date;
- [x] Weblog pagination;
- [x] YouTube video in weblog posts;
- [x] Social network link on the home page or by command in the terminal;
- [x] Feed in weblog;
- [x] SEO-rich website;
- [x] Entire site minified in build: html, images, css and javascript.
- [x] Maintenance page;
- [x] Comments on blog posts with Giscus or Disqus (only in production [jekyll build]);
- [x] Google Analytics (only in production [jekyll build]);
- and more [here]()

# Installation

In the terminal/Command Prompt, run the commands below according to the OS.

**Unix:**

```shell
curl -fsSL https://raw.githubusercontent.com/williamcanin/rawfeed/refs/heads/main/tools/installer/unix/install.sh | sh
```

**Windows:**

```shell
iwr -useb https://raw.githubusercontent.com/williamcanin/rawfeed/refs/heads/main/tools/installer/win/install.ps1 | iex
```

# Usage

After installation, run the command below to see the **rawfeed** command menu:

```shell
npm run help
```

# Settings

## Avatar

**(1)** - Create the folder directory: `assets/images`.

**(2)** - Place your website's images (.jpg|.png) inside this `assets/images` directory.

> Recommendation: Use a 4x4 image.

**(3)** - In the `_config.yml` file, in the `section: [avatar]`, change the value of "`avatar.image`"
to the name of your images. For example:

```yml
avatar:
  open: true
  flip: true
  # note: the image (.jpg|.png) will be searched in the directory: assets/images/
  image:
    front:
      light: your_image_light.png
      dark: your_image_dark.png
    back: your_image_back.png
```

## Posts

Creating a blog post is very easy, first you create a draft (`npm run draft`) and after you finish
the draft, you move it to the post with the command `npm run posts`.

> Note: If you start the server (`npm run serve`), drafts will appear in posts, but they will not
go into production mode (`npm run build`).

**Comments:**

Post comments use [Giscus](https://giscus.app) or [Disqus](https://disqus.com),
configurable in the `_config.yml` file under `section: [blog]`. Whichever one you choose,
you must set the appropriate settings in the `_config.yml` file under `section: [blog]`, and
each post must have `comments: true` set.

To learn more about both, such as how to set them up, visit [Giscus](https://giscus.app) or
[Disqus](https://disqus.com).

# For developer

**Clone and install:**

```shell
git clone https://github.com/williamcanin/rawfeed.git; cd rawfeed; npm install
```

**Manage gem:**

**(1)** - Compile the gem:

```shell
npm run gem
```

**(2)** - Publish the gem:

```shell
npm run publish
```

For more tasks, see: `bundle exec rake --tasks`

### Vendors

[ Technologies and Services Used ]

This [Jekyll](https://jekyllrb.com) theme was developed using the following services and
technologies, to whom we would like to thank for their work and availability:

| Vendor | Link | Use in Theme |
| -------- | ------- | ------- |
| **Bootstrap 5** | [https://getbootstrap.com](https://getbootstrap.com/) | Framework for responsive design and base components |
| **Font Awesome** | [https://fontawesome.com](https://fontawesome.com/) | Providing vector icons |
| **Google Fonts** | [https://fonts.google.com](https://fonts.google.com/) | Styling and appearance of texts (custom fonts) |
| **Google Apps Script** | [https://developers.google.com/apps-script](https://developers.google.com/apps-script) | Email sending and form processing functionality (Contact page). |
| **Google reCAPTCHA** | [https://www.google.com/recaptcha/about/](https://www.google.com/recaptcha/about/) | Form spam protection (if implemented). |
| **Giscus** | [https://giscus.app](https://giscus.app/) | *GitHub Discussions-based commenting system option* |
| **Disqus** | [https://disqus.com](https://disqus.com/) | *Comment system option* |
| **Gulp** | [https://gulpjs.com](https://gulpjs.com/) | Minification and cleaning |

## Donation

Click on the image below to be redirected the donation forms:

<div class="donate">
  <a href="https://github.com/williamcanin/donations/blob/main/README.md">
    <img width="160" height="100" src="https://raw.githubusercontent.com/williamcanin/donations/main/svg/donate/donate-hand.svg" alt="Donations"/>
  </a>
</div>

See the list of our [CONTRIBUTORS](CONTRIBUTING.md).

# License

The theme is available as open source under the terms of [this License](https://github.com/williamcanin/rawfeed/blob/dev/LICENSE.txt).
