<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

<p align="center">
  <img src="https://raw.githubusercontent.com/rawfeed/assets/refs/heads/main/logo/logo.png" alt="Rawfeed" width="150">
  <br>
  <small>rawfeed-jekyll — A raw Jekyll theme for minimalists.</small>
  <br><br>
  <a href="https://badge.fury.io/rb/rawfeed"><img src="https://badge.fury.io/rb/rawfeed.svg?icon=si%3Arubygems" alt="Gem Version" height="18"></a>
  <a href="https://github.com/rawfeed/rawfeed-jekyll/actions/workflows/ci.yml" target="_blank"><img src="https://github.com/rawfeed/rawfeed-jekyll/actions/workflows/ci.yml/badge.svg" alt="CI"></a>
  <a href="https://rubygems.org/gems/rawfeed" target="_blank"><img src="https://img.shields.io/gem/dt/rawfeed?label=downloads" alt="RubyGems Downloads"></a>
  <a href="https://rubygems.org/gems/rawfeed" target="_blank"><img src="https://img.shields.io/badge/ruby-%3E%3D%203.0-ruby" alt="Ruby >= 3.0"></a>
  <a href="LICENSE" target="_blank"><img src="https://img.shields.io/badge/license-MIT-blue" alt="License MIT"></a>
  <br>
  <a href="https://github.com/rawfeed/rawfeed-jekyll/issues" target="_blank"><img src="https://img.shields.io/github/issues/rawfeed/rawfeed-jekyll" alt="GitHub Issues"></a>
  <a href="https://github.com/rawfeed/rawfeed-jekyll/pulls" target="_blank"><img src="https://img.shields.io/github/issues-pr/rawfeed/rawfeed-jekyll" alt="GitHub Pull Requests"></a>
  <a href="https://www.rubydoc.info/gems/rawfeed" target="_blank"><img src="https://img.shields.io/badge/docs-rubydoc-blue" alt="RubyDoc"></a>
  <br><br>
  <a href="https://rawfeed.github.io/rawfeed-jekyll" target="_blank">Documentation</a>
</p>

# rawfeed-jekyll

**rawfeed-jekyll** is a batteries-included Jekyll framework and CLI for Ruby 3.x. It provides a modern workflow for site creation, theme distribution, content management, and gem-based package delivery.

## Project resources

- [CONTRIBUTING.md](CONTRIBUTING.md)
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
- [CHANGELOG.md](CHANGELOG.md)
- [RELEASE_CHECKLIST.md](RELEASE_CHECKLIST.md)
- `.github/ISSUE_TEMPLATE/`
- `.github/pull_request_template.md`
- `.github/release_template.md`

## Requirements

| Required | Version | How to verify | How to install                    |
| -------- | ------- | ------------- | --------------------------------- |
| Ruby     | >= 3.0  | `ruby -v`     | [Ruby](https://www.ruby-lang.org) |
| Gem      | >= 3.0  | `gem -v`      | Bundled with Ruby                 |
| Bundler  | >= 2.0  | `bundler -v`  | `gem install bundler`             |

## Install

See the full documentation at [https://rawfeed.github.io/rawfeed-jekyll/](https://rawfeed.github.io/rawfeed-jekyll/).

## Contributing

Contributions are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for the complete guide covering:

- Development environment setup (Arch Linux, Fedora, VS Code)
- Contribution workflow and pull request rules
- Release process and versioning
- CI, changelog generation, and build instructions

## Changelog

The project changelog is maintained in [CHANGELOG.md](CHANGELOG.md).

## License

This project is released under the terms of [this license](https://rawfeed.github.io/rawfeed-jekyll/license/).

## Donate

If you appreciate this project, consider supporting development.

<div class="donate">
  <a href="https://williamcanin.github.io/donate/" target="_blank">
    <img width="160" height="100" src="https://williamcanin.github.io/assets/images/icons/donate.svg" alt="Donate"/>
  </a>
</div>

## TUI appearance and configuration

The interface uses the `example-v2` design. Its reference styles live in
`_sass/tui/_reference.scss`; Jekyll-specific adaptations live in
`_sass/tui/_jekyll.scss`. Both compile through `assets/css/style.scss`.
The JetBrains Mono font is served locally from `assets/fonts/`.

Customize `_data/screen/interface.yml` to set the banner, initial theme,
clock, search limit, effects, boot duration, keyboard shortcuts, labels,
languages, translations, command aliases, and custom terminal responses.
Preferences selected by a visitor persist in their browser and take precedence
over the initial theme, language, and effects. Reduced motion disables animations.
Use `commands` to add or override terminal responses and `command_aliases` to
rename built-in commands, for example `date: today`.

Existing `_data/screen/` files continue to supply navigation, home, social,
blog, contact, donation, maintenance, and resume content. The shared layout
also supplies the same appearance and interactions to newly generated pages.
Jekyll Polyglot builds localized Markdown pages and posts. To add a locale,
add its code to `languages` in `_config.yml`, add a label under
`interface.languages` in `_data/screen/interface.yml`, then create
`_data/screen/locales/<code>.yml`. Put only the strings that differ in that
file; nested YAML values are merged with the default data, and omitted values
fall back to the default language. Screen data includes navigation, home,
projects, weblog, contact, donation, resume, maintenance, and system messages,
so adding another language does not require JavaScript or template changes.
The selector labels, browser language shortcut, and terminal language command
read the configured language codes and locale data.

For a page, create a matching file beneath the locale directory. For example,
`pt/_pages/contact.md` pairs with `_pages/contact.md`; use the same
`permalink: /contact/` and set `lang: pt`. To translate a post, copy its
dated source into `pt/_posts/`, translate its title, description, and Markdown,
then set the same `page_id` and `permalink` as the original and set
`lang: pt`. The example pair is `_posts/2025-09-20-welcome-to-jekyll.md` and
`pt/_posts/2025-09-20-welcome-to-jekyll.md`. If URLs differ by language, give
both translations the same `page_id`. The default language remains at the root;
other locales use their language prefix. Untranslated Markdown falls back to
the default-language version.
The terminal is a browser interface and does not execute shell commands.

For local development against this checkout, use
`RAWFEED_DEV_PATH="$PWD" bundle exec jekyll serve`.

Search is available exclusively on the home page. The search shortcut from other
pages returns to the home search field. The classic terminal is the only terminal;
its prompt and built-in help use `_data/screen/home.yml`, with optional custom
responses and aliases supplied by `_data/screen/interface.yml`.

The classic terminal is always available; `home.terminal.enable` is no longer used.
On mobile, the application fills the dynamic viewport and uses touch-sized controls.
Animations respect the operating system reduced-motion preference.

### Browser terminal commands

The browser terminal is configured in `_data/screen/interface.yml` and
`_data/screen/home.yml`. Built-in commands include `help`, `ls`, `open`,
`projects`, `socials`, `contact`, `theme`, `lang`, `about`, `date`, `find`,
`clear`, `shred`, `home`, `scan`, `boot`, `echo`, `whoami`, `neofetch`, and
`exit`. Use `find "words"` to search the same localized page and post index as
Home search. Add command aliases or fixed custom responses in the interface
YAML; these are browser commands and do not execute operating-system commands.

### Ruby CLI

The `rawfeed` executable provides site scaffolding and Ruby-side content tools:
`rawfeed new`, `build`, `serve`, `backup`, `clean`, `minify`, content generators,
layout toggles, and restore commands. The browser terminal commands above belong
to generated sites and are separate from this Ruby CLI.
`rawfeed minify` uses Terser for modern JavaScript and needs an ExecJS-compatible
JavaScript runtime; ImageMagick is required only for image minification.
Sites created by `rawfeed new` also include npm aliases for the Ruby CLI, so
the documented commands such as `npm run serve`, `npm run create:draft`, and
`npm run clean:cache` remain available. Run `npm run help` for the available
Rawfeed commands.
