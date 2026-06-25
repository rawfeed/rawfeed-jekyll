# Release checklist

This file defines the release readiness criteria and steps for any new version of `rawfeed-jekyll`.
Update the target version at the top of each section before starting the release process.

## Readiness criteria

- [ ] Versioning follows [Semantic Versioning](https://semver.org/): `MAJOR.MINOR.PATCH`
- [ ] `lib/rawfeed/core/version.rb` has been updated to the release version
- [ ] `rawfeed.gemspec` metadata is correct
- [ ] `CHANGELOG.md` includes a release entry for the new version
- [ ] The code is reviewed, tested, and approved in a pull request
- [ ] GitHub Actions CI passes on `main` and on the release branch
- [ ] The gem package builds successfully with `gem build rawfeed.gemspec`
- [ ] The library loads successfully with `require "rawfeed"`
- [ ] Issue and PR templates are available in `.github/`
- [ ] `README.md`, `CONTRIBUTING.md`, and `CODE_OF_CONDUCT.md` are up to date
- [ ] License and project metadata are visible and correct
- [ ] Release branches are created from `main` using `release/<version>` naming

## Quality checks

- [ ] Documentation is sufficient for contributors and maintainers
- [ ] Release process is defined and repeatable
- [ ] Core functionality is stable and does not introduce regressions
- [ ] Dependencies are compatible with Ruby 3.x
- [ ] The public changelog is maintained in `CHANGELOG.md`
- [ ] All tests pass with `bundle exec rspec`

## Release steps

1. Create a release branch from `main`:

   ```bash
   git checkout -b release/<version>
   ```

2. Update `lib/rawfeed/core/version.rb` to the new version.

3. Update the version reference in `Gemfile` if needed:

   ```ruby
   gem "rawfeed", "~> <version>"
   ```

4. Add or update the release entry in `CHANGELOG.md`.
   If desired, generate a draft with:

   ```bash
   bundle exec github_changelog_generator
   ```

5. Open a pull request from the release branch into `main`.
   Use `.github/pull_request_template.md` as a guide.

6. Ensure CI passes on the release branch and on the pull request.

7. Build the gem:

```sh
gem build rawfeed.gemspec
```

8. Verify the package loads:

```sh
bundle exec ruby -Ilib -e 'require "rawfeed"; puts Rawfeed::VERSION'
```

9. Publish the gem:

```sh
gem push rawfeed-<version>.gem
```

10. Create a GitHub release using `.github/release_template.md` as the release notes template.

11. Tag the release and close the associated milestone or issue.

12. Reset this checklist for the next release cycle.

## Notes

Follow [Semantic Versioning](https://semver.org/):

- `MAJOR` — incompatible API changes
- `MINOR` — backwards compatible new features
- `PATCH` — backwards compatible bug fixes
