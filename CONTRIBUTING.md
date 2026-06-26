# Contributing to rawfeed-jekyll

Thank you for contributing to **rawfeed-jekyll**. This guide explains the repository workflow, issue and pull request expectations, versioning, changelog management, and release readiness.

## GitHub templates

This repository uses GitHub templates to standardize contributions:

- Bug reports: `.github/ISSUE_TEMPLATE/bug_report.md`
- Feature requests: `.github/ISSUE_TEMPLATE/feature_request.md`
- Pull requests: `.github/pull_request_template.md`
- Release notes: `.github/release_template.md`

Use the template that best fits your contribution type.

## Contribution workflow

1. Fork the repository.
2. Create a feature branch from `main`.
   - Example: `feature/add-new-component`
   - Example: `fix/avatar-flip`
3. Keep each pull request focused on a single feature, bug fix, or documentation change.
4. Push your branch to your fork and open a pull request against `main`.
5. In the pull request description, include:
   - What the change does
   - Why it is needed
   - How to test or verify it
   - Screenshots or examples for visual changes

## Pull request rules

- Use descriptive branch names and commit messages.
- Rebase or merge from `main` before requesting review if the branch is stale.
- Keep the PR title clear and concise.
- Add a changelog or release note entry for user-facing changes.
- Avoid unrelated changes in the same PR.
- Link the PR to an existing issue when applicable.

## Issue guidelines

When opening a new issue, include:

- A concise title
- A clear description of the problem or request
- Expected behavior
- Actual behavior
- Steps to reproduce
- Environment details
- Relevant logs or screenshots

For feature requests, explain the use case and how it improves the project.
For bug reports, include minimal reproduction details.

## Versioning

This project follows [Semantic Versioning](https://semver.org/): `MAJOR.MINOR.PATCH`.

- `MAJOR` for incompatible API changes.
- `MINOR` for backwards compatible additions.
- `PATCH` for backwards compatible bug fixes.

The project version is defined in `lib/rawfeed/core/version.rb` and referenced by `rawfeed.gemspec`.

## Release process

Before publishing a release, complete the tasks in [RELEASE_CHECKLIST.md](RELEASE_CHECKLIST.md).

Release branches should be created from `main` using the `release/<version>` naming convention.

1. Update `lib/rawfeed/core/version.rb` to the new version.
2. Add a changelog entry in `CHANGELOG.md`.
3. Build the gem:

   ```bash
   gem build rawfeed.gemspec
   ```

4. Verify the package loads:

   ```bash
   bundle exec ruby -Ilib -e 'require "rawfeed"; puts Rawfeed::VERSION'
   ```

5. Publish the gem:

   ```bash
   gem push rawfeed-<VERSION>.gem
   ```

6. Create a GitHub release using `.github/release_template.md` if needed.

## Changelog

The changelog is stored in `CHANGELOG.md`.

Keep entries clear and user-focused. Each release section should summarize important fixes, improvements, and changes.

## Development setup

### System dependencies

Install Ruby and the required development tools for your distribution before proceeding.

**Arch Linux**

```bash
sudo pacman -S ruby ruby-lsp rubocop
```

**Fedora**

```bash
sudo dnf install ruby ruby-devel rubygems
gem install ruby-lsp rubocop
```

> On Fedora, `ruby-lsp` and `rubocop` are not available as native packages and must be installed via `gem install`.

After installing, verify the tools are available:

```bash
ruby --version
ruby-lsp --version
rubocop --version
bundle --version
```

### Editor (VS Code)

Install the [Ruby LSP extension](https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp) (`Shopify.ruby-lsp`).

Add the following to your workspace or user `settings.json`:

```json
{
  "rubyLsp.rubyVersionManager": {
    "identifier": "none"
  }
}
```

> Using `"none"` is correct when Ruby is installed system-wide (via `pacman` or `dnf`) rather than through a version manager such as `rbenv` or `asdf`.

### Project setup

```bash
git clone https://github.com/rawfeed/rawfeed-jekyll.git
cd rawfeed-jekyll
export RAWFEED_DEV_PATH="$PWD"
bundle install
rawfeed install
bundle exec rawfeed serve
```

If you use `direnv`, add the following to your `.envrc`:

```bash
export RAWFEED_DEV_PATH="$PWD"
```

## Continuous integration

CI runs on pull requests to `main` and on pushes to `main` or `release/**` branches.

The CI job performs:

- `bundle install` with Bundler cache
- Library loading validation via `bundle exec ruby -Ilib -e 'require "rawfeed"'`
- `bundle exec rspec` for test coverage
- `bundle exec rawfeed build --destination .site_build` to ensure the theme builds cleanly
- `gem build rawfeed.gemspec` to verify package creation

## Changelog generation

The project uses `github_changelog_generator` to help generate changelogs from GitHub issues and tags. Configuration is in `.github_changelog_generator` using `key=value` pairs (one per line).

```bash
bundle exec github_changelog_generator
```

If you prefer a manual approach, edit `CHANGELOG.md` directly.

## Build and publish

Build the gem package:

```bash
bundle exec rake build
```

Publish the gem to RubyGems:

```bash
gem push rawfeed-<VERSION>.gem
```

## Code quality and testing

- Prefer small, targeted changes.
- Add tests when possible.
- When tests do not exist, document expectations and validate manually.
- Ensure CI passes before merging.

## Code of Conduct

Please follow the project Code of Conduct in `CODE_OF_CONDUCT.md`.

## Maintainer notes

- Review contributions for clarity and compatibility.
- Keep documentation and release notes up to date.
- Encourage contributors to open issues first for significant changes.
