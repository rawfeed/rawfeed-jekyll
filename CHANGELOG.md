# Changelog

All important changes to this project are listed here.

## [0.1.2] - 2025-11-14

### Bugfix

- Fixing video include url bug
- Markdown errors on pages have been fixed. Some styles were missing.

### Added

#### Sections to the Resume: "Certificate" add "Markdown text"

In the `_data/resume.yml` file new sections added:

```yml
# section: [Certificates]
certificates:
  enable: true
  caption: Certificates
  section:
    - course: LPIC-2
      certificate: https://github.com/williamcanin/rawfeed
      period:
        year: 2020
        hours: 20 hours
      company:
        name: Linux Professional Institute
        site: https://www.lpi.org

# section: [Markdown]
markdown:
  enable: true
  caption: Notes
  content: |
    - I led a class of **Computer Engineering** students in the modern **AI course**.
    It was over **170 hours** of classes.
```

#### Datelang plugin

Adding plugin to display date according to the applied language.

In the `_config.yml` file you now need the **section: [datelang]**. Add this code:

```yml
# section: [datelang]
datelang:
  format: "%b %-d, %Y"
  lang: "en_US" # en_US | pt_PT | jp_JP | ch_CH | es_ES | fr_FR | it_IT | de_DE | ru_RU
```

#### Reading time for posts and page

Posts and pages now have a reading time warning. It can be enabled or disabled completely
in `_config.yml`. On a page level, the control is unique; each page will have the `reading_time:`
option. The **Reading time** section in `_config.yml` looks like this:

```yml
# section: [Reading time]
reading_time:
  enable: true
  words_per_minute: 180
  message: ["Read this post in approximately", "Read this post in less than"]
  minutes_label: ["minute", "minutes"]
```

## [0.1.1] - 2025-10-12

### Bugfix

- CRUCIAL! Fixing "relative_url" error for url with baseurl.
  When using site with baseurl in _config.yml, all menu URLs and other files pointed to the wrong
  location. This release fixed this crucial bug.

## [0.1.0] - 2025-10-12

### Added

- One-command installation (via Unix);
- A terminal emulator on the home page with commands;
- Commands for manipulating page headers, posts and drafts in markdown;
- Smart floating TOC in posts;
- Theme change: light/dark;
- Chart in posts;
- Stylized Markdown;
- Avatar opens in modal with inversion animation for each different theme (light/dark);
- Enables and Disables weblog;
- Home page with about or blog, you decide with one command;
- A quick search field on the weblog using keyword and date;
- Weblog pagination;
- YouTube video in weblog posts;
- Social network link on the home page or by command in the terminal;
- Feed in weblog;
- SEO-rich website;
- Entire site minified in build: html, images, css and javascript.
- Maintenance page;
- Comments on blog posts with Giscus or Disqus (only in production [jekyll build]);
- Google Analytics (only in production [jekyll build]);
