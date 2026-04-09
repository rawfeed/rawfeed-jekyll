<p align="center">
  <img src=".github/logo.png" alt="Rawfeed" width="150">
  <br>
  <small>rawfeed-jekyll — A minimal, batteries-included Jekyll CMS</small>
  <br>
  <a href="https://badge.fury.io/rb/rawfeed" target="_blank"><img src="https://badge.fury.io/rb/rawfeed.svg" alt="Gem Version" height="18"></a>
  <br>
  <a href="https://rawfeed.github.io/rawfeed-jekyll" target="_blank">Documentation</a>
</p>

## Requirements

| Required | Version | How to verify | How to install                    |
| -------- | ------- | ------------- | --------------------------------- |
| Ruby     | >= 3.0  | `ruby -v`     | [Ruby](https://www.ruby-lang.org) |
| Gem      | >= 3.0  | `gem -v`      | **Ruby** contains **Gem**         |
| Bundler  | >= 2.0  | `bundler -v`  | `gem install bundler`             |

# Install

See: [https://rawfeed.github.io/rawfeed-jekyll/](https://rawfeed.github.io/rawfeed-jekyll/)

<!-- ## Linux / macos

```sh
bash <(curl -fsSL https://rawfeed.github.io/install.sh)
```

## Windows

```powershell
iex (Invoke-WebRequest -Uri "https://rawfeed.github.io/install.ps1" -UseBasicParsing).Content
``` -->

# For developer

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines, issue and PR templates, and release process.

After installing the requirements, prepare the environment as follows:

```shell
git clone https://github.com/rawfeed/rawfeed-jekyll.git
cd rawfeed-jekyll
export RAWFEED_DEV_PATH="$PWD"
rawfeed install
bundle exec rawfeed serve
```

> [!TIP]
> You can use `direnv` to manage your environment variables through a `.envrc` file in the project root.
>
> Linux / macos:
>
> ```bash
> echo "export RAWFEED_DEV_PATH=\"\$PWD\"" > .envrc
> direnv allow
> ```
>
> Windows (PowerShell):
>
> ```bash
> "export RAWFEED_DEV_PATH=`"$PWD`"" | Out-File -Encoding utf8 .envrc
> direnv allow
> ```

## Generate the gem

**(1)** - Compile the gem:

```shell
gem build rawfeed.gemspec
```

## Publish the gem

```shell
gem push rawfeed-<VERSION>.gem
```

> Note: Option available only to the gem maintainer (William C. Canin) in [**RubyGems**](https://rubygems.org/).

# Changelog

See [here](https://rawfeed.github.io/rawfeed-jekyll/changelog/)

# License

The theme is available as open source under the terms of [this License](https://rawfeed.github.io/rawfeed-jekyll/license/).

# Donate

Click on the image below to be redirected to the donation forms:

<div class="donate">
  <a href="https://williamcanin.github.io/donate/" target="_blank">
    <img width="160" height="100" src="https://williamcanin.github.io/assets/images/icons/donate.svg" alt="Donate"/>
  </a>
</div>

> It is very important that you make a donation to motivate further development of rawfeed-jekyll. :)
