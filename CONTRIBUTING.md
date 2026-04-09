# Contributing to rawfeed-jekyll

Thank you for contributing to **rawfeed-jekyll**! This guide explains how to open issues, create pull requests, follow versioning, and keep the changelog up to date.

## Contribution workflow

1. Fork the repository.
2. Create a feature branch from `main`.
   - Example: `feature/add-new-component`
   - Example: `fix/avatar-flip`
3. Keep each pull request focused on a single feature or fix.
4. Push your branch to your fork and open a pull request against `main`.
5. In the pull request description, include:
   - What the change does
   - Why it is needed
   - Steps to reproduce or validate
   - Screenshot or sample output for UI/content changes

## Pull request rules

- Use descriptive branch names and commit messages.
- Rebase or merge from `main` before requesting review if the branch is stale.
- Keep the PR title clear and concise.
- Add a changelog entry for any user-facing change.
- Do not include unrelated changes in the same PR.
- Link the PR to an existing issue when applicable.

## Issue guidelines

When opening a new issue, include:

- A short title that summarizes the problem or request.
- A clear description of the behavior you expect.
- The actual behavior you observe.
- Steps to reproduce the issue.
- The environment or platform you are using.
- Any relevant logs, screenshots, or examples.

For feature requests, describe the use case and why it is valuable.
For bug reports, include the minimal reproduction steps.

## Versioning

This project uses [Semantic Versioning](https://semver.org/): `MAJOR.MINOR.PATCH`

- `MAJOR` when you make incompatible API changes.
- `MINOR` when you add functionality in a backwards compatible manner.
- `PATCH` when you make backwards compatible bug fixes.

The current version is defined in `lib/rawfeed/core/version.rb` and referenced by `rawfeed.gemspec`.

### Release process

1. Update `lib/rawfeed/core/version.rb` to the new version.
2. Build the gem with:

   ```bash
   gem build rawfeed.gemspec
   ```

3. Publish the gem with:

   ```bash
   gem push rawfeed-<VERSION>.gem
   ```

4. Update the changelog and release notes.

See [RELEASE_CHECKLIST.md](RELEASE_CHECKLIST.md) for stability criteria and the pre-release checklist.

## Changelog

The project currently publishes a changelog at:

- `https://rawfeed.github.io/rawfeed-jekyll/changelog/`

Keep the changelog accurate by adding an entry for every release.
Entries should summarize user-facing changes, bug fixes, and notable improvements.

## Development setup

Follow the existing repository developer setup in `README.md`:

```bash
git clone https://github.com/rawfeed/rawfeed-jekyll.git
cd rawfeed-jekyll
export RAWFEED_DEV_PATH="$PWD"
rawfeed install
bundle exec rawfeed serve
```

If you use `direnv`, add `export RAWFEED_DEV_PATH="$PWD"` to `.envrc`.

## Code quality and testing

- Prefer clear, minimal changes.
- Add tests for new behavior when possible.
- If no tests exist for an area, document the expected behavior and validate manually.
- Consider adding automated checks or CI in future contributions.

## Code of Conduct

Please follow the project Code of Conduct in `CODE_OF_CONDUCT.md`.

## Notes for maintainers

- Review PRs for quality, clarity, and compatibility with the current Jekyll theme.
- Keep the documentation up to date when major changes land.
- Encourage contributors to open issues before implementing large features.
