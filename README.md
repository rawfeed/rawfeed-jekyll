<p align="center">
  <img src=".github/logo.png" alt="Rawfeed" width="150">
  <br>
  <small>rawfeed-jekyll — A minimal, batteries-included Jekyll CMS</small>
  <br>
  <a href="https://badge.fury.io/rb/rawfeed" target="_blank"><img src="https://badge.fury.io/rb/rawfeed.svg" alt="Gem Version" height="18"></a>
  <br>
  <a href="https://rawfeed.github.io/rawfeed-jekyll" target="_blank">Documentation</a>
</p>

# rawfeed-jekyll

**rawfeed-jekyll** is a lightweight Jekyll CMS and theme framework for Ruby 3.x. It provides a modern workflow for site creation, theme distribution, and gem-based package delivery.

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

## Developer setup

```shell
git clone https://github.com/rawfeed/rawfeed-jekyll.git
cd rawfeed-jekyll
export RAWFEED_DEV_PATH="$PWD"
rawfeed install
bundle exec rawfeed serve
```

### Using direnv

```bash
echo "export RAWFEED_DEV_PATH=\"\$PWD\"" > .envrc
direnv allow
```

## Contribution workflow

This repository includes GitHub templates for issues and pull requests.

- Bug reports: `.github/ISSUE_TEMPLATE/bug_report.md`
- Feature requests: `.github/ISSUE_TEMPLATE/feature_request.md`
- Pull requests: `.github/pull_request_template.md`

See [CONTRIBUTING.md](CONTRIBUTING.md) for the complete contributor workflow, release process, and code guidelines.

## Release process

The release workflow is documented in [RELEASE_CHECKLIST.md](RELEASE_CHECKLIST.md) and [CHANGELOG.md](CHANGELOG.md).

- Version is defined in `lib/rawfeed/core/version.rb`
- Package metadata is in `rawfeed.gemspec`
- CI is configured in `.github/workflows/ci.yml`
- Release notes are captured by `.github/release_template.md`
- Changelog generation can be assisted by `cliff` when commit messages use Conventional Commits

## Changelog generation

This repo includes a `cliff` configuration file at `.cliff.yml`.
Use the following command to regenerate `CHANGELOG.md` from commit history:

```shell
bundle exec cliff changelog
```

If your commit messages follow Conventional Commits, `cliff` can keep the changelog aligned with your release workflow.

## Build and publish

Build the gem:

```shell
gem build rawfeed.gemspec
```

Publish the gem:

```shell
gem push rawfeed-<VERSION>.gem
```

## Continuous integration

This repository includes GitHub Actions at `.github/workflows/ci.yml` that:

- check out the repository
- install Ruby and dependencies
- validate that `rawfeed` loads successfully
- build the gem package

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
