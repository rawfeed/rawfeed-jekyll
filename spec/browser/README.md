# Browser regression checks

These checks use an isolated copy of the site. They enable pixels, publication
listing, pagination and mock contact credentials, and set `baseurl: /preview`.
The source checkout and its user configuration are not changed.

From the repository root:

```sh
npm install --prefix /tmp/rawfeed-browser-tools playwright
python3 spec/browser/prepare.py /tmp/rawfeed-browser-fixture
RAWFEED_DEV_PATH="$PWD" bundle exec jekyll build \
  --source /tmp/rawfeed-browser-fixture \
  --config /tmp/rawfeed-browser-fixture/_config.yml \
  --destination /tmp/rawfeed-browser-output/preview
python3 -m http.server 4175 --directory /tmp/rawfeed-browser-output
```

In another terminal, from the repository root:

```sh
NODE_PATH=/tmp/rawfeed-browser-tools/node_modules node spec/browser/tui.cjs
```

Set `CHROME_BIN` when Chrome is installed outside `/usr/bin/google-chrome-stable`.
Set `RAWFEED_BROWSER_URL` to use another server URL, including `/preview`.
The suite verifies navigation options, theme and scanline persistence, language
selection, keyboard selection, universal home search, Markdown tabs and details, clipboard,
TOC scrolling, donation QR modals, resume print layout, and widths of 390, 760
and 1440 pixels. It fails on uncaught JavaScript errors.
