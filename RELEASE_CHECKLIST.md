# Release checklist for 1.0.0

This file defines the release readiness criteria for `1.0.0`.

## Readiness criteria

- [ ] Versioning follows [Semantic Versioning](https://semver.org/): `MAJOR.MINOR.PATCH`
- [ ] `lib/rawfeed/core/version.rb` has been updated to the release version
- [ ] `rawfeed.gemspec` metadata is correct
- [ ] `CHANGELOG.md` includes a release entry for `1.0.0`
- [ ] The code is reviewed, tested, and approved in a pull request
- [ ] GitHub Actions CI passes on `main` and on the release branch
- [ ] The gem package builds successfully with `gem build rawfeed.gemspec`
- [ ] The library loads successfully with `require "rawfeed"`
- [ ] Issue and PR templates are available in `.github`
- [ ] `README.md`, `CONTRIBUTING.md`, and `CODE_OF_CONDUCT.md` are up to date
- [ ] License and project metadata are visible and correct
- [ ] Release branches are created from `main` using `release/<version>` naming

## Quality checks

- [ ] Documentation is sufficient for contributors and maintainers
- [ ] Release process is defined and repeatable
- [ ] Core functionality is stable and does not introduce regressions
- [ ] Dependencies are compatible with Ruby 3.x
- [ ] The public changelog is maintained in `CHANGELOG.md`

## Release steps

1. Create a release branch from `main`, for example `release/1.0.0`.
   - Use this file as the release branch base: `RELEASE_CHECKLIST.md`.
2. Update `lib/rawfeed/core/version.rb` to `1.0.0`.
3. Add or update the release entry in `CHANGELOG.md`.
   - If desired, generate a changelog draft with:

     ```bash
     bundle exec github_changelog_generator
     ```

4. Open a pull request from the release branch into `main`.
5. Ensure CI passes on the release branch and on the pull request.
6. Build the gem:

   ```bash
   gem build rawfeed.gemspec
   ```

7. Verify the package loads:

   ```bash
   bundle exec ruby -Ilib -e 'require "rawfeed"; puts Rawfeed::VERSION'
   ```

8. Publish the gem:

   ```bash
   gem push rawfeed-1.0.0.gem
   ```

9. Create a GitHub release and add release notes using `.github/release_template.md`.
10. Tag the release and close the associated milestone or issue.

## Notes

Version `1.0.0` is appropriate once the project is stable, well-documented, and ready for production use.
