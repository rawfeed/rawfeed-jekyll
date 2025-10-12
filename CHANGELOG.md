# Changelog

All important changes to this project are listed here.

## [0.1.1] - 2025-09-12

### Bugfix

- CRUCIAL! Fixing "relative_url" error for url with baseurl.
  When using site with baseurl in _config.yml, all menu URLs and other files pointed to the wrong
  location. This release fixed this crucial bug.

## [0.1.0] - 2025-09-12

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
