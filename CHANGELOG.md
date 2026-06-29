# Changelog

All notable changes to this project will be documented in this file.
## [v1.0.3] - 2026-06-29

### Bug Fixes

- Add change_yml call to pixels:enable/disable for _config.yml published state ([`d6f0788`](https://github.com/rawfeed/rawfeed-jekyll/commit/d6f07880fec0eab1ff44215e7310decce3599742))

## [v1.0.2] - 2026-06-27

### Bug Fixes

- Use absolute URL for commit links in git-cliff template ([`8324308`](https://github.com/rawfeed/rawfeed-jekyll/commit/83243083ffde1f5b471118d87e15c082c7d34b11))
- Prevent double-nested folders in zip by removing Regexp.escape ([`8015960`](https://github.com/rawfeed/rawfeed-jekyll/commit/801596086d97411f44572cb171421b299e85a11f))
- Add rubyzip as runtime dependency in gemspec ([`8b9025a`](https://github.com/rawfeed/rawfeed-jekyll/commit/8b9025a5aec2c79df900c287de17f55f65aaa002))

### Features

- Adding configurations for Docker ([`99a7a43`](https://github.com/rawfeed/rawfeed-jekyll/commit/99a7a4332746d4a29d357efabac1087e859f2a34))
- Added cliff.toml to manage CHANGELOGs ([`a8fc924`](https://github.com/rawfeed/rawfeed-jekyll/commit/a8fc924a9ab7ae0522640ff24c0218c22eb5e6a7))
- Updating version to 1.0.2 ([`d56be2f`](https://github.com/rawfeed/rawfeed-jekyll/commit/d56be2f8b2ca185769688552b1162b40cdce7144))
- Add Dockerfile for development with rawfeed-jekyll ([`23d51f5`](https://github.com/rawfeed/rawfeed-jekyll/commit/23d51f5a1d6deeb691d2ab00b35aec474b4c9de7))

### Refactor

- Refactor: dependency changes
- Dependencies previously in the Gemfile have been moved to rawfeed.gemspec ([`54f8b85`](https://github.com/rawfeed/rawfeed-jekyll/commit/54f8b85cc94ebd5dbc9db6a19c1201d1d7e2b423))

## [v1.0.1] - 2026-06-25

### Bug Fixes

- Zero-pad day in search result date format ([`f846ccb`](https://github.com/rawfeed/rawfeed-jekyll/commit/f846ccb632152414a9630fde4ac3d484d8de831e))
- Search results show undefined date and link does not navigate ([`8d05dc1`](https://github.com/rawfeed/rawfeed-jekyll/commit/8d05dc1eda7dd52e7eb04b7ba99d78c0348a98b3))

### Miscellaneous

- Add  RAWFEED_DEV_PATH=$PWD" ([`9d52637`](https://github.com/rawfeed/rawfeed-jekyll/commit/9d52637dc2db11ca5c3ca321555c5f320027cb81))

## [v1.0.0] - 2026-06-25

### Bug Fixes

- Guard pub plugin against nil theme and improve image minifier security ([`7f52557`](https://github.com/rawfeed/rawfeed-jekyll/commit/7f52557d998e6bdc3aa9461add2587559c5444ce))
- Resolve undefined constants, unchecked errors, and backup robustness ([`7a7a263`](https://github.com/rawfeed/rawfeed-jekyll/commit/7a7a26308251154a0b0f767cfd24058f207ecaa9))
- Load Chart.js script only once via conditional JS to prevent duplicate script tags ([`d52e5d1`](https://github.com/rawfeed/rawfeed-jekyll/commit/d52e5d19313c8e25020a24a298206f160dfd9e12))
- Use bracket notation for CSP hyphen keys and correct update_date variable ([`f7a7db6`](https://github.com/rawfeed/rawfeed-jekyll/commit/f7a7db6bcd6fbdf66eebe5ef17fc13e153b34d4c))
- Add null guards across multiple scripts to prevent TypeError when DOM elements are missing ([`721d9b4`](https://github.com/rawfeed/rawfeed-jekyll/commit/721d9b46aaa9197b3424ef418ff78be90ffd40c5))
- Prevent HTML minifier from collapsing whitespace inside pre, code, textarea, and svg tags ([`0a7f0bf`](https://github.com/rawfeed/rawfeed-jekyll/commit/0a7f0bfcab12158ead5b3b40d8f97b7b278ae532))
- Adding missing with front matter of post pixels ([`45563bc`](https://github.com/rawfeed/rawfeed-jekyll/commit/45563bc161f6ce88bc35bbd59aa992a4eba23449))
- The project had the lazy_loader.rb file, which was designed to load Jekyll-dependent code only when Jekyll was initialized. This worked for themes, but in the CLI flow (rawfeed create:*, restore:*, list:*) it left the classes as Rawfeed::Draft without require, causing uninitialized constants. ([`0fb8cec`](https://github.com/rawfeed/rawfeed-jekyll/commit/0fb8ceccb874652a8e83bbd79201fb2813688dd9))
- Remove whitespace between menu-wrap-link and menu items ([`0edf960`](https://github.com/rawfeed/rawfeed-jekyll/commit/0edf960502731790d50b1eec4c8608fffbac0bca))
- New slogan in accordance with the project. ([`b339747`](https://github.com/rawfeed/rawfeed-jekyll/commit/b339747e135395d2330b0b24d50401c66916774a))
- The README.md and ci.yml files contained the wrong command for generating the website. They were using Jekyll instead of rawfeed. ([`88bd130`](https://github.com/rawfeed/rawfeed-jekyll/commit/88bd130872896c4a0850b7c136750c02ab318cb6))
- Remove reading_time style ([`995bcc9`](https://github.com/rawfeed/rawfeed-jekyll/commit/995bcc9c4053b282b6dde3606a353d8286510d5f))
- Changing from options.yml to generic.yml ([`3ad381d`](https://github.com/rawfeed/rawfeed-jekyll/commit/3ad381db715d0d6c510b6b4ba7fb663ffbe28935))
- Remove reading_time ([`0a1addf`](https://github.com/rawfeed/rawfeed-jekyll/commit/0a1addfaf4d0c6175d2fe63a45fa34c8f5e37052))
- Loading generic.yml file ([`48550e8`](https://github.com/rawfeed/rawfeed-jekyll/commit/48550e81c038f0992fd43bbbf2bc37946169455e))
- Remove date url search ([`a69270e`](https://github.com/rawfeed/rawfeed-jekyll/commit/a69270e8a8c4879c6bbc70eb36e8a1878d80f3c7))
- Remove assigned include ([`2533ab1`](https://github.com/rawfeed/rawfeed-jekyll/commit/2533ab1b85df6ca163086b7b3b1a6f30858cf138))
- Remove reading_time ([`884352d`](https://github.com/rawfeed/rawfeed-jekyll/commit/884352df329346d7cc54bc5d5fe5fc2147266d77))
- Using a fixed Gemfile instead of creating one with the gem. Reason: compatibility for both the development and end-user sides. ([`a9f6466`](https://github.com/rawfeed/rawfeed-jekyll/commit/a9f646633410e03c4a13e815cfc8dcea172c7fcc))
- Change url example ([`6c63265`](https://github.com/rawfeed/rawfeed-jekyll/commit/6c63265605d1702a828c02afb78f83bef9adf2ca))
- Add message to use bundle config set ([`3d5ebe1`](https://github.com/rawfeed/rawfeed-jekyll/commit/3d5ebe141866c8c70f0f32f79fba073c289ecc87))
- Resolve rubyzip loading error in Jekyll theme initialization ([`b8f406a`](https://github.com/rawfeed/rawfeed-jekyll/commit/b8f406a94618a2adcfaba26d1b323e2ebcd0f017))
- Removing the .gray, unrecognizable color, and leaving a neutral color. ([`b4ddcc5`](https://github.com/rawfeed/rawfeed-jekyll/commit/b4ddcc5039fc61c7880a088b7182edfbeb8be719))
- Simplify image minification using ImageMagick system commands ([`e9da260`](https://github.com/rawfeed/rawfeed-jekyll/commit/e9da2601aa92c5b651f732059b6db0945b05e2db))
- Prevent nested folder creation with rawfeed new . --force ([`6e5836e`](https://github.com/rawfeed/rawfeed-jekyll/commit/6e5836e5203ba16d5fd03bf8ab788967ddc1f94c))
- Removing rubyzip not installed verification ([`77e0846`](https://github.com/rawfeed/rawfeed-jekyll/commit/77e084679947d439a7953f5d63408b22ea9cadbe))
- Remove rubyzip from runtime dependencies and add graceful error handling ([`a8af274`](https://github.com/rawfeed/rawfeed-jekyll/commit/a8af2743f016ba5fc41b6995050691c98a23cf49))
- Add rubyzip ([`9b09740`](https://github.com/rawfeed/rawfeed-jekyll/commit/9b09740cc2276cc557e0324e5ef752f25676f6e4))
- Lazy load rubyzip and uglifier to avoid dependency errors on gem initialization ([`55c4de5`](https://github.com/rawfeed/rawfeed-jekyll/commit/55c4de545e520e6577f6bda4a8d89291dc2db2ee))
- Add rubyzip dependency ([`63e238d`](https://github.com/rawfeed/rawfeed-jekyll/commit/63e238d6943aeba9be05f730dd46d0a92dde2742))
- Rename robots.tx to robots.txt to ensure proper crawler recognition ([`079e787`](https://github.com/rawfeed/rawfeed-jekyll/commit/079e78738d02b9085c39f85608e24331e97625bc))
- Correcting the spelling of variables ([`b9491a9`](https://github.com/rawfeed/rawfeed-jekyll/commit/b9491a97bb4b69fe4be9fab0a0f4d24a2d0ca630))
- Correcting spelling error ([`e723828`](https://github.com/rawfeed/rawfeed-jekyll/commit/e723828df55dc139da2bf5278d01a87cf3079b4f))
- Correct color using colorize gem ([`9cfee24`](https://github.com/rawfeed/rawfeed-jekyll/commit/9cfee24404be8e051c7be0b2c565e04095e8a102))
- Correct spelling errors across multiple files ([`11ca8ea`](https://github.com/rawfeed/rawfeed-jekyll/commit/11ca8ea0c77e7836bc00f479ec2eb29503928abe))
- Pure Ruby CLI and Installer with robust path detection ([`404b5d6`](https://github.com/rawfeed/rawfeed-jekyll/commit/404b5d666de94efbffba7a9409e9d4685c3fe405))

### Features

- New version log 1.0.0 ([`262e14e`](https://github.com/rawfeed/rawfeed-jekyll/commit/262e14eb920bcf42ea2bc97f2102fff9165ed55b))
- Display post tags inline without list markers ([`534698f`](https://github.com/rawfeed/rawfeed-jekyll/commit/534698fb237cf033a1336c5a907fb7417a51d479))
- Add cliff ([`400e078`](https://github.com/rawfeed/rawfeed-jekyll/commit/400e07885c632b8cbd53e6de86f76499de3ca6fe))
- Add image minification with webp and avif format conversion ([`1e4fc6b`](https://github.com/rawfeed/rawfeed-jekyll/commit/1e4fc6b5b335a88518c309368a644e54ecf4d8a2))
- Add rubyzip for Gemfile ([`06a19a5`](https://github.com/rawfeed/rawfeed-jekyll/commit/06a19a59d241b1209e80bdadcd304b26ddf4d3bb))
- Add _data/texts.yml ([`9b6cea8`](https://github.com/rawfeed/rawfeed-jekyll/commit/9b6cea82f2997bebceb8dd75a685bb54f0c226c5))
- Add rawfeed new . to create site in current directory with --force support ([`4bf0bf9`](https://github.com/rawfeed/rawfeed-jekyll/commit/4bf0bf92dfb4243ffe0ba2fee100ef2df520ecd9))
- Add rawfeed backup command with --destination and --append options ([`b58fe1d`](https://github.com/rawfeed/rawfeed-jekyll/commit/b58fe1d99bd428764e538aae1fb5fc524e307037))
- Add robots.txt in dev and gem ([`ca761e3`](https://github.com/rawfeed/rawfeed-jekyll/commit/ca761e30b183f2424d794f81b46fea9445780626))
- Add gem http_parser.rb in Gemfile ([`2b954f2`](https://github.com/rawfeed/rawfeed-jekyll/commit/2b954f29b88cfb34411d4aedb5b297a1746c7cc6))
- Refactoring and new features ([`ef569c3`](https://github.com/rawfeed/rawfeed-jekyll/commit/ef569c30a7b44bce6f12adedefb610817330521d))
- Add build and serve commands with Jekyll options passthrough ([`e2abe0e`](https://github.com/rawfeed/rawfeed-jekyll/commit/e2abe0e8de3bfad68112ac48370b7fcdefe122f3))
- Adding missing options to the menu ([`b19e5f3`](https://github.com/rawfeed/rawfeed-jekyll/commit/b19e5f3f923c8c460bfae85eec1a3e9113d42d71))
- Adding an option to enable/disable TOC in the front matter ([`a9b5af4`](https://github.com/rawfeed/rawfeed-jekyll/commit/a9b5af4cd61359284bfbcb9bcdc0661abc903d89))
- Add command init and install ([`ca42ee3`](https://github.com/rawfeed/rawfeed-jekyll/commit/ca42ee39d4c037cfef2cdec946ba107df280f470))
- Add code to create template and node packages install ([`c5bd496`](https://github.com/rawfeed/rawfeed-jekyll/commit/c5bd496730d5da713cd1325011af7fe1634e2ebf))
- Add template ([`bdb62bb`](https://github.com/rawfeed/rawfeed-jekyll/commit/bdb62bb246a9f7919e4673a409876e9bc11e0596))
- Add command exe rawfeed ([`08d2385`](https://github.com/rawfeed/rawfeed-jekyll/commit/08d2385300bce1f2485f724fb532e92660a82e30))
- Add minify command rawfeed ([`4c48e37`](https://github.com/rawfeed/rawfeed-jekyll/commit/4c48e371313c498d68874002c3e53c2b52a80907))
- Add clean cache command ([`374bc07`](https://github.com/rawfeed/rawfeed-jekyll/commit/374bc07088f6aea0381e04f855fc9198abff6dc6))
- Add minify files command ([`971f04e`](https://github.com/rawfeed/rawfeed-jekyll/commit/971f04e32acfeef5cf59201f76e0dc5e34c9fa5c))
- Add command list posts ([`95191dd`](https://github.com/rawfeed/rawfeed-jekyll/commit/95191dd4fcbe508ee9c99249a878540db87c1875))
- Add executables ([`9414d1c`](https://github.com/rawfeed/rawfeed-jekyll/commit/9414d1cd743d3b05ee6e95ace5c95f0ce7ba8c4e))
- Add command list posts ([`3fba8ec`](https://github.com/rawfeed/rawfeed-jekyll/commit/3fba8ec61c1fe743c7cb95dcd49430d1e33b2214))

### Miscellaneous

- Add new extensions ([`bc23eb9`](https://github.com/rawfeed/rawfeed-jekyll/commit/bc23eb95c95c0338e44ccda1212ae6cfc18ad7db))
- Adjust github-changelog-generator config ([`c25b571`](https://github.com/rawfeed/rawfeed-jekyll/commit/c25b5711c611a907225bef4aab12d4da89f0268f))
- Add bundler tasks ([`1c78dc8`](https://github.com/rawfeed/rawfeed-jekyll/commit/1c78dc865d3a9d13f575a6d19da915e5079a7fea))
- Fix github_changelog_generator config, document changelog behavior, and ignore site build output ([`993aee4`](https://github.com/rawfeed/rawfeed-jekyll/commit/993aee48b78fbaf7c4ce3bb213d650ff353c514c))
- Add .rspec_status in .gitignore ([`3dbf4a6`](https://github.com/rawfeed/rawfeed-jekyll/commit/3dbf4a651bbe0705735585576b5c742e1e9aa883))
- Merge branch 'dev' into 1.0.0 ([`53dfb78`](https://github.com/rawfeed/rawfeed-jekyll/commit/53dfb78c64abfc848019485d7d0e63da1ccdba93))
- Add .rspec_status in .gitignore ([`9b8ece4`](https://github.com/rawfeed/rawfeed-jekyll/commit/9b8ece4154ab4020479a5c771ef3ceb6047ad288))
- Update from Portuguese to English ([`9969809`](https://github.com/rawfeed/rawfeed-jekyll/commit/99698092a1b54bdcdae4ec84a4cdc395e87a0efe))
- Configure github_changelog_generator and add real RSpec coverage with CI support ([`a8a0080`](https://github.com/rawfeed/rawfeed-jekyll/commit/a8a0080fe4ecdeef12f82e8065902ca9877b7b5b))
- Add .rspec_status in .gitignore ([`55f261a`](https://github.com/rawfeed/rawfeed-jekyll/commit/55f261ae48baa6841748025fc828038075da2666))
- Update deps ([`05268a2`](https://github.com/rawfeed/rawfeed-jekyll/commit/05268a296b5fbf6566763dae22129bfa87fbbfe5))
- Delete cliff config ([`fc836f4`](https://github.com/rawfeed/rawfeed-jekyll/commit/fc836f4337c68649111215bb4f4b7ac6b94823d7))
- Update to 1.0.0 ([`cd773e0`](https://github.com/rawfeed/rawfeed-jekyll/commit/cd773e08081c764ed2a2af311f8ac3fcafa00f24))
- Add RSpec test suite, stronger CI workflow, and changelog generator support ([`fbe491c`](https://github.com/rawfeed/rawfeed-jekyll/commit/fbe491ce6f4bbe97f0bc95963a6cf1d5741ef60c))
- Add cliff ([`e3bbf87`](https://github.com/rawfeed/rawfeed-jekyll/commit/e3bbf8788fbbd298a8320f4ef107ce0eebb2d271))
- Add cliff changelog support and refine release/PR workflow docs ([`802491c`](https://github.com/rawfeed/rawfeed-jekyll/commit/802491c6ac68ec34d9f6db8461dcf97c0f5f9cf5))
- Add professional English release workflow, changelog, and GitHub release template ([`d15aade`](https://github.com/rawfeed/rawfeed-jekyll/commit/d15aade605854e3fc78e60763622dd52f65fb760))
- New files for CI gem ([`d424aa8`](https://github.com/rawfeed/rawfeed-jekyll/commit/d424aa8cbd27328c876367cd748827d7190b4683))
- Add news cSpell.words ([`d19ccc0`](https://github.com/rawfeed/rawfeed-jekyll/commit/d19ccc0a9bb78481ff048efd141bbb96ffd47dd4))
- Add github-pages.yml ([`0e42996`](https://github.com/rawfeed/rawfeed-jekyll/commit/0e42996f47f337d5521ea2ba4252a85e24dbfae4))
- Add GitHub contribution templates, CI workflow, README links, and 1.0.0 release checklist ([`661c8af`](https://github.com/rawfeed/rawfeed-jekyll/commit/661c8afff5f9946bd0b40956f6e6d7d69a132ae3))
- Add CONTRIBUTING.md developer guide with PR, versioning, changelog, and issue rules ([`2750d18`](https://github.com/rawfeed/rawfeed-jekyll/commit/2750d188ea0f4c0b3e31895e68111d0f6ce15476))
- New structure and values ​​for _data ([`906d4a1`](https://github.com/rawfeed/rawfeed-jekyll/commit/906d4a10bbf38c5227a364fc3d0f93ea1424f09e))
- Replacing new values ​​after updating _data ([`5bb282a`](https://github.com/rawfeed/rawfeed-jekyll/commit/5bb282a66536ff10fd51124f77e28b599bd5bfba))
- Correcting indentation ([`57da57c`](https://github.com/rawfeed/rawfeed-jekyll/commit/57da57c4e93c91e6560038093e0465501dcdf546))
- Update .vscode/settings.json ([`f6d9806`](https://github.com/rawfeed/rawfeed-jekyll/commit/f6d98060125cfcb08b57f9352db52b21f0f19e2d))
- Remove _draft ([`f3a374f`](https://github.com/rawfeed/rawfeed-jekyll/commit/f3a374f6a39f5b9a121bb08e2305e5d3085e8bdc))
- Update Gemfile.lock ([`a6d5fd9`](https://github.com/rawfeed/rawfeed-jekyll/commit/a6d5fd93ed92bfb139a821c17ac816690e2c0a20))
- Update Gemfile.lock ([`e3a24fb`](https://github.com/rawfeed/rawfeed-jekyll/commit/e3a24fb90bf452e4682f3d634b4142c26a98587b))
- Update .vscode/settings.json ([`1de5461`](https://github.com/rawfeed/rawfeed-jekyll/commit/1de546107fead1ff415c7923ae72ff902737a830))
- Update .vscode/settings.json ([`a04de1a`](https://github.com/rawfeed/rawfeed-jekyll/commit/a04de1a3aea6d74ce3b256e5ba2450873ead8322))
- Remove gray color in screen ([`5c6f736`](https://github.com/rawfeed/rawfeed-jekyll/commit/5c6f7365fbb462a15ecaf635e12c944a8f08a0a3))
- Adding missing commands ([`d767cec`](https://github.com/rawfeed/rawfeed-jekyll/commit/d767cec14d5b01a1aa92d09848f64240bd7e1b33))
- Update .vscode/settings.json ([`5049c94`](https://github.com/rawfeed/rawfeed-jekyll/commit/5049c94199a1dcb8f516b04c99d45646b8d8cd60))
- Adding escape lines to prevent markdown from breaking HTML structure. ([`e4e79b3`](https://github.com/rawfeed/rawfeed-jekyll/commit/e4e79b36f789f29808e068efab1ccf32e52d9b5b))
- Correcting a function that was being passed with a non-existent name. ([`2ca2f81`](https://github.com/rawfeed/rawfeed-jekyll/commit/2ca2f810206cd9a952c45ec25da41f181cdfe13e))
- Fixing a critical bug ([datelang: invalid date '%b %d, %Y']) in the datelang plugin. ([`b5eeecf`](https://github.com/rawfeed/rawfeed-jekyll/commit/b5eeecf0c56995b6b4b625438cef7b809f296ae3))
- Add rescue Interrupt ([`1656882`](https://github.com/rawfeed/rawfeed-jekyll/commit/1656882225ddd6bc79440d106882f31f9a44c20f))
- Rename layout tags ([`b5eae7f`](https://github.com/rawfeed/rawfeed-jekyll/commit/b5eae7f51cc6e01cdb9c43678da8126cd826488e))
- Rename layout tags ([`7932351`](https://github.com/rawfeed/rawfeed-jekyll/commit/7932351095346b1ff360f567b459b0c58f50bf59))
- Add extension ([`e1191b9`](https://github.com/rawfeed/rawfeed-jekyll/commit/e1191b92551d8df3ed44dad18e61892082961e5a))
- Improving the use of .vscode/settings.json ([`b6c3ffe`](https://github.com/rawfeed/rawfeed-jekyll/commit/b6c3ffeb90b88c66461be360bc71103bc6433a86))
- Update .vscode/settings.json ([`c1247c7`](https://github.com/rawfeed/rawfeed-jekyll/commit/c1247c7084e85d73b0a0f2895811d7b912f39c4e))
- Removing unnecessary excludes ([`c226d33`](https://github.com/rawfeed/rawfeed-jekyll/commit/c226d335a2810dbc5e60e91b6970a8f2aec607e5))
- Update README.md ([`dd3166f`](https://github.com/rawfeed/rawfeed-jekyll/commit/dd3166f040c4f689ef995577793e1f1f4124c8ed))
- Change comment pt-br to en-us ([`8ddc3f2`](https://github.com/rawfeed/rawfeed-jekyll/commit/8ddc3f28c1e4e95251c528532bf86c43a9ef01cf))
- Change comment pt-br to en-us ([`a887aa2`](https://github.com/rawfeed/rawfeed-jekyll/commit/a887aa27a0f2a5a72c78b8074d0d235fd93e1886))
- Improving text display on screen ([`384c088`](https://github.com/rawfeed/rawfeed-jekyll/commit/384c08889b01d540906eea122ac8439f932a4d3f))
- Change comment pt-br to en-us ([`31fdf9a`](https://github.com/rawfeed/rawfeed-jekyll/commit/31fdf9a0e03090f51a6b4110c3c99ab9646d5797))
- Update README.md ([`012c527`](https://github.com/rawfeed/rawfeed-jekyll/commit/012c52782b27694f551235df0fecac948176f53f))
- Update README.md ([`5e2e865`](https://github.com/rawfeed/rawfeed-jekyll/commit/5e2e8655397ffe386fb13792df6077ec5d7226b3))
- Update README.md ([`4b678d1`](https://github.com/rawfeed/rawfeed-jekyll/commit/4b678d1cc7b3e492524b4400116cbbd66459ee09))
- Update .vscode/settings.json ([`07771dc`](https://github.com/rawfeed/rawfeed-jekyll/commit/07771dc0d0508453dc82d2d06678a55700beaaa8))
- New extension action buttons ([`87483ee`](https://github.com/rawfeed/rawfeed-jekyll/commit/87483ee3b4df5055c3a41796f961b2b8ff61a76c))
- Added dynamic text behind the .yml configuration ([`b55ed12`](https://github.com/rawfeed/rawfeed-jekyll/commit/b55ed122a4a76497a2172f05c016186856d69386))
- Changing the blog search to lib fuse. Removing simple-jekyll-search ([`67ee2ac`](https://github.com/rawfeed/rawfeed-jekyll/commit/67ee2ac10b560144c9769d88a6ea3cd6cadc0cf6))
- Change url by me coffee ([`d4df79f`](https://github.com/rawfeed/rawfeed-jekyll/commit/d4df79fb26efa67309f3dc82ecb2b3512e72d862))
- Changing the path of the images ([`3280d1e`](https://github.com/rawfeed/rawfeed-jekyll/commit/3280d1e12beeb2198e28afb2ffc31b0367bd5ad4))
- 0.4.0 ([`503ee31`](https://github.com/rawfeed/rawfeed-jekyll/commit/503ee31e65749bffacf8c587ad8fe0e6a848e886))
- Correcting command minify:files ([`fc24ce6`](https://github.com/rawfeed/rawfeed-jekyll/commit/fc24ce650afe8f9ba41a3cb6c5cd3cc6b4b5b4ac))
- Add folder _data in copy to site ([`7f505fc`](https://github.com/rawfeed/rawfeed-jekyll/commit/7f505fca3584e0b2e4e22896b088b48df5020f3a))
- Fix TypeError in datelang plugin and incorrect ROOT path ([`11f7446`](https://github.com/rawfeed/rawfeed-jekyll/commit/11f7446573c85fec39e9f171bf18bfa7a471db15))
- Commenting out unused imports ([`45da692`](https://github.com/rawfeed/rawfeed-jekyll/commit/45da692fbf2fdefa2998c6308fe52067725031ca))
- Deleting useless stuff ([`cb8ea13`](https://github.com/rawfeed/rawfeed-jekyll/commit/cb8ea134192ee7be7deeb53f501d0ca0608145b6))
- Correcting a path error in the Datelang plugin. ([`88813b5`](https://github.com/rawfeed/rawfeed-jekyll/commit/88813b50c7bd7f9cede63f6a74fd5e477649b577))
- Rm folders ([`14ebd6f`](https://github.com/rawfeed/rawfeed-jekyll/commit/14ebd6f8bacbe97a6e56dca12978b0bce55691c1))
- Add .gitlab.ci.yml ([`94a511e`](https://github.com/rawfeed/rawfeed-jekyll/commit/94a511ece90c3301dc67dc641316748e55648a58))
- Update .hidden - adding new files and folder ([`1eefb31`](https://github.com/rawfeed/rawfeed-jekyll/commit/1eefb31e0f05a8696d1c995886c5c80a5ae710e1))
- Bew files and folder in gem ([`0843c45`](https://github.com/rawfeed/rawfeed-jekyll/commit/0843c45c9ffd4206ee4d439ed0102a0acc1e7e3d))
- Update 0.4.0 ([`b6191e6`](https://github.com/rawfeed/rawfeed-jekyll/commit/b6191e6b0027da8f9ad0817e86fa14952e5b2cfe))
- Update .gitignore ([`e53b4c0`](https://github.com/rawfeed/rawfeed-jekyll/commit/e53b4c01ae0e304db44fb4c5593ee8d08ee8283a))
- Fix GEM_ROOT and template path logic in Installer ([`e68ad0b`](https://github.com/rawfeed/rawfeed-jekyll/commit/e68ad0b47446ea6504ae20ba2ee00438df9de0d4))
- Remove exe rawfeed-tools ([`9f9115b`](https://github.com/rawfeed/rawfeed-jekyll/commit/9f9115bff086a3ade506a3fab6b89f9df0ef63c0))
- Correcting error Gem.find_spec_for_exe ([`d560330`](https://github.com/rawfeed/rawfeed-jekyll/commit/d560330134fe49a83b6bf59fd0cefaafa601f7c9))
- Gemfile ([`7ce1af8`](https://github.com/rawfeed/rawfeed-jekyll/commit/7ce1af8b9ee08c926f916bf6bfe2b7794212442f))
- Removing unnecessary code ([`c888c46`](https://github.com/rawfeed/rawfeed-jekyll/commit/c888c4644208cb350f595ce600031a9fa04aa7bf))
- Import tools commands ([`097060f`](https://github.com/rawfeed/rawfeed-jekyll/commit/097060f31e023bae024a293e63ef533ab24659f0))
- Update Gemfile minimal ([`5337889`](https://github.com/rawfeed/rawfeed-jekyll/commit/5337889ae4e2314ef2b4eb5e52cfff2a0f560f17))
- Correcting command for rawfeed-tools ([`bef4e8f`](https://github.com/rawfeed/rawfeed-jekyll/commit/bef4e8fb99b2429d81ef2c6a20019ac15a2d0e98))
- Update config gem ([`b772ef1`](https://github.com/rawfeed/rawfeed-jekyll/commit/b772ef1743959829aee95f56509ff35811ab8e62))
- Update ([`6099197`](https://github.com/rawfeed/rawfeed-jekyll/commit/6099197f6728a8b7f46ece7f59ccfc4d7fc73e52))
- Update ([`0175e32`](https://github.com/rawfeed/rawfeed-jekyll/commit/0175e320a0556ff21a4868a9be189ba3922f3e6d))

### Refactor

- Rename header to navbar ([`891dc06`](https://github.com/rawfeed/rawfeed-jekyll/commit/891dc06f5bfbc2356576649af107ad15b3c89d67))
- Rename variables ([`9603d44`](https://github.com/rawfeed/rawfeed-jekyll/commit/9603d44671767d47b56d24ecbc1b981f73ad2459))
- Reorganize _data files into 3-level structure ([`94ce48a`](https://github.com/rawfeed/rawfeed-jekyll/commit/94ce48ad5679764a2fce5e410f53a18e914450e9))
- Move all jekyll dependencies from gemspec to Gemfile ([`1f949dd`](https://github.com/rawfeed/rawfeed-jekyll/commit/1f949ddff9fa0ee738a67d2389f60bb22b8e48be))
- Replace ruby-vips with mini_magick and add rubyzip as runtime dependency ([`b96184f`](https://github.com/rawfeed/rawfeed-jekyll/commit/b96184fd9d8fca130c13a901846316b9937f5449))
- Remove rubyzip ([`c280e57`](https://github.com/rawfeed/rawfeed-jekyll/commit/c280e57d057d462df3ca39bb25b45aeaf4f57e01))
- Organizing excludes ([`4a49518`](https://github.com/rawfeed/rawfeed-jekyll/commit/4a4951815c4c95e736262754cb461dd112b562d8))
- Implementing warning comments for end users. ([`3774700`](https://github.com/rawfeed/rawfeed-jekyll/commit/37747007183cc4dbdab864bbc69a6c8741c541cd))
- Updating the new slogan of rawfeed-jekyll ([`42f4e32`](https://github.com/rawfeed/rawfeed-jekyll/commit/42f4e32d407cbb6cc80fdb26d861de14d1b57040))
- Structural improvement ([`cd18bb4`](https://github.com/rawfeed/rawfeed-jekyll/commit/cd18bb421afa7234c9795b48751e74b52d53d84a))
- Replace jekyll with rawfeed in help output ([`e319b18`](https://github.com/rawfeed/rawfeed-jekyll/commit/e319b18a5078807b135cca7435b7f8252c004d71))
- Migrate from Node.js to Ruby for minification and cleaning ([`e4e35bf`](https://github.com/rawfeed/rawfeed-jekyll/commit/e4e35bf47a8da15b116b81c66ce32c50ece94c88))
- Update Bootstrap asset path ([`6bffc6c`](https://github.com/rawfeed/rawfeed-jekyll/commit/6bffc6c840ad9bade861061684cb5880ee7d8d40))
- New structure for TOC ([`2399f10`](https://github.com/rawfeed/rawfeed-jekyll/commit/2399f10bb89576a6c5ee3cebac0d99d38c5ed2f0))
- Changing variable names (assign) in data.liquid ([`bafd66b`](https://github.com/rawfeed/rawfeed-jekyll/commit/bafd66bbd2fc7da841507e1667a71206bf762229))
- Improving the donation structure ([`f376481`](https://github.com/rawfeed/rawfeed-jekyll/commit/f37648126bc56b26f819ea6e99d8d7990c1d7fa5))
- Improving the donation structure ([`286197e`](https://github.com/rawfeed/rawfeed-jekyll/commit/286197ec8b49d1183fc35b1c73b83f5de144cf66))
- Resolve new path imagens ([`94ffe4b`](https://github.com/rawfeed/rawfeed-jekyll/commit/94ffe4ba5f4441c2c51114b508f72cc91d98aec7))
- Remove baseurl ([`4f458a5`](https://github.com/rawfeed/rawfeed-jekyll/commit/4f458a583d8699331c0fa477751e1e96eccb96c0))
- Optimizing gem root path ([`27818c8`](https://github.com/rawfeed/rawfeed-jekyll/commit/27818c89dd28cdb7ede9f2ee9e90a9296b32883e))
- Adding rawfeed environment variable ([`107c553`](https://github.com/rawfeed/rawfeed-jekyll/commit/107c5534cb3f5fd252c624829b854a20bdafed18))
- Modularize library structure into logical subdirectories ([`f042e89`](https://github.com/rawfeed/rawfeed-jekyll/commit/f042e89d2e255dc658bce0de42f480b92bfdbd43))
- Improving the structure for adding files and folders and fixing an error when copying the assets folder. ([`8b90373`](https://github.com/rawfeed/rawfeed-jekyll/commit/8b903731c774613914d5b42b779eb4ee0e045b55))
- Add new folder and files in gem ([`8839539`](https://github.com/rawfeed/rawfeed-jekyll/commit/8839539e0bf49d166e22d53db9c0a210d5a1a213))
- Improving the structure for inserting files and folders ([`1fb2161`](https://github.com/rawfeed/rawfeed-jekyll/commit/1fb2161f73679b864d5d1944e877c81aa9231613))
- Copy file and folders ([`917bfd3`](https://github.com/rawfeed/rawfeed-jekyll/commit/917bfd3756f979c9743cb533218a0edccb90e4db))
- Remove template dir. copy all files in gem ([`b06de2e`](https://github.com/rawfeed/rawfeed-jekyll/commit/b06de2eec68d5ce20c52e5144396fe74e0de1d15))
- Simplify executable into self-configuring bash shell wrapper and CLI class ([`bc800f7`](https://github.com/rawfeed/rawfeed-jekyll/commit/bc800f7c70ce31e14c8c5af0acd0946d4205eda4))
- Correct polyglot wrapper logic ([`c64f3b9`](https://github.com/rawfeed/rawfeed-jekyll/commit/c64f3b91cba6faab922d9599403c658e828d769b))
- Use polyglot shell wrapper for self-configuring GEM_PATH ([`2e7d8aa`](https://github.com/rawfeed/rawfeed-jekyll/commit/2e7d8aa0a92e79631a0e9252e487c55fa97340eb))
- Improve exe/rawfeed robustness and error messages ([`9daf2ca`](https://github.com/rawfeed/rawfeed-jekyll/commit/9daf2ca6172d3197c77ea780c05a5e00282c6e1d))
- Adding command new ([`faf8ef9`](https://github.com/rawfeed/rawfeed-jekyll/commit/faf8ef97aece6d71ed98616eaf847cfaa89ac297))
- Import module installer ([`b42e7ff`](https://github.com/rawfeed/rawfeed-jekyll/commit/b42e7ffd690b771eb9935475cbf91c0f29770bd7))
- Adding module installer ([`0efc131`](https://github.com/rawfeed/rawfeed-jekyll/commit/0efc1310f28223f0d2086e022ad31011b5958d10))
- Replacing the init command with the new command ([`63cca74`](https://github.com/rawfeed/rawfeed-jekyll/commit/63cca742626f0eb49dec1c690748aecd4e7998eb))
- Replacing the init command with the new command, and creating package.json and Gemfile ([`6700cfd`](https://github.com/rawfeed/rawfeed-jekyll/commit/6700cfd2dde5bd06e965e739f2ea62db7a280e4b))
- Update commands ([`55b097e`](https://github.com/rawfeed/rawfeed-jekyll/commit/55b097e803ffc9ce8ff58b8cfd70dde6bce200e9))
- Unifying commands Rakefile in gem rawfeed ([`2086818`](https://github.com/rawfeed/rawfeed-jekyll/commit/20868184edd20e36c5aa14e419c94c49cf9934a0))
- Unifying tools into a single module. ([`dc15d08`](https://github.com/rawfeed/rawfeed-jekyll/commit/dc15d08957169f6a5979bd42ab29e6e3776e3550))
- Update rawfeed command cli ([`ddadbcd`](https://github.com/rawfeed/rawfeed-jekyll/commit/ddadbcd10014a90ba34e6ee0c09375a49b63ca41))
- Unifying tools into a single module. ([`41e635a`](https://github.com/rawfeed/rawfeed-jekyll/commit/41e635a92427bb15aa7cf6c0375b70f87785c1fd))
- Unifying tools into a single module. ([`b6dee90`](https://github.com/rawfeed/rawfeed-jekyll/commit/b6dee90accd0de7e9bb573c8130b6364eadf62ee))
- Format strings menu ([`21b9426`](https://github.com/rawfeed/rawfeed-jekyll/commit/21b9426fc4b84c83c47443b0bc51ff7caea0b97c))

### Testing

- Expand test coverage from 39 to 61 examples ([`e7ac37b`](https://github.com/rawfeed/rawfeed-jekyll/commit/e7ac37b5b413b6474e1d9f7d439e84642e5099cd))
- Add tests for command build and install dependencies rawfeed ([`5b63d95`](https://github.com/rawfeed/rawfeed-jekyll/commit/5b63d95529df3ae3a84371416c02a0a320fe06e4))
- Add tests for commands rawfeed cli ([`764c971`](https://github.com/rawfeed/rawfeed-jekyll/commit/764c9719d732e0d4691bd9cdd15c83e44bcfb14f))

## [v0.3.1] - 2026-04-04

### Miscellaneous

- 0.3.1 ([`56c4f1a`](https://github.com/rawfeed/rawfeed-jekyll/commit/56c4f1a69391b58e30bd69a0c453d30470fc3184))
- Correcting relative URL error ([`c265755`](https://github.com/rawfeed/rawfeed-jekyll/commit/c265755642359e026f692a44b23900273162bb89))

### Testing

- Adding baseurl for future relative URL testing. ([`b311568`](https://github.com/rawfeed/rawfeed-jekyll/commit/b31156819155ce700e29036bba3faea497b1644e))

## [v0.3.0] - 2026-04-04

### Features

- Improving the visual appearance of TOC ([`6b25876`](https://github.com/rawfeed/rawfeed-jekyll/commit/6b2587652644974055050a8e596f3a9165548c09))
- Adding a new setting for TOC ([`b8ab77e`](https://github.com/rawfeed/rawfeed-jekyll/commit/b8ab77e31670f4696dfd4bc385c3beaad446b564))
- Importing data.liquid ([`f2a1614`](https://github.com/rawfeed/rawfeed-jekyll/commit/f2a16148656267d44cb1ac52b76fab30a463d305))
- Updating new example script for contact. ([`6dfae32`](https://github.com/rawfeed/rawfeed-jekyll/commit/6dfae32a9b42e8df556e9acd1571a4f2a518f7bd))
- Using pure Javascript instead of CoffeeScript ([`3c7edf8`](https://github.com/rawfeed/rawfeed-jekyll/commit/3c7edf8e2f840d21d921f7eb8410148c94db0d36))
- Removing support for CoffeeScript ([`595bc47`](https://github.com/rawfeed/rawfeed-jekyll/commit/595bc477d6b68a580295c74447a5c8388ccac980))
- Remove old TOC include ([`c7723de`](https://github.com/rawfeed/rawfeed-jekyll/commit/c7723de474300272a9003408ee96c19d63a3cb92))
- Implementing new floating TOC ([`c995654`](https://github.com/rawfeed/rawfeed-jekyll/commit/c995654f7c7299214f7e874190e637c621f1d7a3))
- Add donation script ([`52d9bfe`](https://github.com/rawfeed/rawfeed-jekyll/commit/52d9bfefcc625de6bc932aa2f6ce5df06be7edc4))
- Add cards color ([`f8cc252`](https://github.com/rawfeed/rawfeed-jekyll/commit/f8cc25246847f7e68c3387c55da88507d82d4053))
- Add donation style ([`c8f8501`](https://github.com/rawfeed/rawfeed-jekyll/commit/c8f8501f2858139edf35c83d6a32567ef9398584))
- Add donation style ([`f1981e0`](https://github.com/rawfeed/rawfeed-jekyll/commit/f1981e03f92f6bf2a5cc5d6e8808af4ab2f9f7d6))
- Add cards colors ([`3101498`](https://github.com/rawfeed/rawfeed-jekyll/commit/31014981c30fb480ae33aded105b153475364739))
- Add donation page ([`c81ed54`](https://github.com/rawfeed/rawfeed-jekyll/commit/c81ed54582ba68ab4f86fa1b83ad5b7025656a63))
- Add donation layout ([`9095ba1`](https://github.com/rawfeed/rawfeed-jekyll/commit/9095ba1a41437a0d59ade12f3214e20fe94ebac2))
- Adding donation script ([`53423a3`](https://github.com/rawfeed/rawfeed-jekyll/commit/53423a3ee058955ed99ff5d99643c3bc4b5bc49b))
- Adding donation config ([`9f7c61f`](https://github.com/rawfeed/rawfeed-jekyll/commit/9f7c61f417fd9898a138f339d4f67907d98af71e))
- Adding section donation ([`32ff7f8`](https://github.com/rawfeed/rawfeed-jekyll/commit/32ff7f89235db0951ffd6edd6cf13c10147f44ef))
- Adding example script for Google Apps Script ([`c495d55`](https://github.com/rawfeed/rawfeed-jekyll/commit/c495d55d5f96c8505f1e41ee52462d0c2d9af517))

### Miscellaneous

- Update year ([`46bfc3e`](https://github.com/rawfeed/rawfeed-jekyll/commit/46bfc3ebd8c1243764d327e8e41ecd168a3fec1b))
- Update year ([`a595213`](https://github.com/rawfeed/rawfeed-jekyll/commit/a59521319dcc38e257941a467e2046017f133d53))
- 0.3.0 ([`86dd400`](https://github.com/rawfeed/rawfeed-jekyll/commit/86dd40097d9a52b4250cdf7cfb12c7a0dcd3fd0e))
- Update Gemfile.lock ([`e16a86a`](https://github.com/rawfeed/rawfeed-jekyll/commit/e16a86a18c21f561b8e9b4e43bc765d58303cb4b))
- Update version to 0.2.12 ([`b9bf839`](https://github.com/rawfeed/rawfeed-jekyll/commit/b9bf839dcd1aab9e4d6ed5cdd0d94a6cc04716f2))
- Update .gitignore ([`da7d8e4`](https://github.com/rawfeed/rawfeed-jekyll/commit/da7d8e4e68537dad44a039e58ec8987e9d394d0d))
- Getting rid of useless things ([`80790dd`](https://github.com/rawfeed/rawfeed-jekyll/commit/80790dd7b85059447ab6d0fcee95c2223daac591))
- Getting rid of useless things ([`93215f7`](https://github.com/rawfeed/rawfeed-jekyll/commit/93215f7daaf43b817ac53aa7319deee661f3f2f8))
- Correcting the new path for the scripts. ([`def9c96`](https://github.com/rawfeed/rawfeed-jekyll/commit/def9c969637d9b627ae7a84b3a5834b5998511a1))
- Update Gemfile.lock ([`fb46655`](https://github.com/rawfeed/rawfeed-jekyll/commit/fb46655ae9af8fc425a828eaa09b6ba26936bfea))
- Cleaning up unnecessary things ([`0d33b86`](https://github.com/rawfeed/rawfeed-jekyll/commit/0d33b863f0d3f8aab12767eab1929b3c396715a6))
- Remove old TOC ([`3c64ca5`](https://github.com/rawfeed/rawfeed-jekyll/commit/3c64ca5cba196a8ddb38b5cdc007e0fc4171924e))
- Correcting TOC top in left layout ([`bdeab59`](https://github.com/rawfeed/rawfeed-jekyll/commit/bdeab5921e23bd0505636169be5cc8108d94c0b5))
- Correcting overflow in TOC ([`2798057`](https://github.com/rawfeed/rawfeed-jekyll/commit/279805759e1a33449cda21bbf9db7fc60b15334e))
- Add images donation layout ([`0966c62`](https://github.com/rawfeed/rawfeed-jekyll/commit/0966c62693e2f586dfe1b15e7162cc8bf2a7099e))
- Remove user select ([`2edb5ca`](https://github.com/rawfeed/rawfeed-jekyll/commit/2edb5ca7c9c91894ea41ed543f7f0767ec937ec2))
- Add .js liquid-javascript ([`20cf85d`](https://github.com/rawfeed/rawfeed-jekyll/commit/20cf85d09d1399d907fccd608d0d4c2e95ede235))
- Update version 0.2.11 ([`3244659`](https://github.com/rawfeed/rawfeed-jekyll/commit/3244659913127411e2908daadf7d29628a843365))

## [v0.2.11] - 2026-03-19

### Bug Fixes

- Changing CORS to text/plain instead of json ([`b7e7075`](https://github.com/rawfeed/rawfeed-jekyll/commit/b7e70758412db398734d055d7871418fde831aa2))

### Miscellaneous

- Update version 0.2.11 ([`1c3f8be`](https://github.com/rawfeed/rawfeed-jekyll/commit/1c3f8be0f4229dfa1137157b70d07a1b78641c7e))
- Update version 0.2.10 ([`854bebc`](https://github.com/rawfeed/rawfeed-jekyll/commit/854bebca56f3bdf499cd7caefe6f22786c497969))

## [v0.2.10] - 2026-03-18

### Bug Fixes

- Correcting a bug in the Google Analytics 4 script and adding cookies to the 'config'. ([`de8cb4f`](https://github.com/rawfeed/rawfeed-jekyll/commit/de8cb4fd2e90db545964466c66b6c9de7e5fae93))

### Miscellaneous

- Update version 0.2.10 ([`dd817e6`](https://github.com/rawfeed/rawfeed-jekyll/commit/dd817e674361756f0f4caa19c002beac7ca0bfa6))

## [v0.2.9] - 2026-03-15

### Miscellaneous

- Update Gemfile.lock ([`6ec6afe`](https://github.com/rawfeed/rawfeed-jekyll/commit/6ec6afe9f5cead0b40a8c29a27dcd7c17f28d4c5))
- SEO improvements ([`8a4a5f8`](https://github.com/rawfeed/rawfeed-jekyll/commit/8a4a5f83fe0d4e24162fd293892c4dadd3a80f27))
- Update for Google Analytics 4 ([`305f500`](https://github.com/rawfeed/rawfeed-jekyll/commit/305f5000dbbb317fe3487dcad03851abe4422ac6))
- Remove old js google analytics ([`e5bded7`](https://github.com/rawfeed/rawfeed-jekyll/commit/e5bded755c5eaef1e78c911b11243d681ceda66d))
- Update version ([`f445cb1`](https://github.com/rawfeed/rawfeed-jekyll/commit/f445cb1a29878df8760e48f10cfe5aa13ca79840))

## [v0.2.8] - 2025-11-05

### Miscellaneous

- Correcting error in footer that was overlapping the page ([`8747810`](https://github.com/rawfeed/rawfeed-jekyll/commit/87478101c76053345d550b84ed7c179c13b4e6ba))
- Change margin-bottom global ([`80a2aeb`](https://github.com/rawfeed/rawfeed-jekyll/commit/80a2aeb35573ab0380fbb5a5080431a0e59da2ee))
- Update new version 0.2.8 ([`5f1273d`](https://github.com/rawfeed/rawfeed-jekyll/commit/5f1273dbf48efe0006c347e55334bafea668f796))

## [v0.2.7] - 2025-11-01

### Miscellaneous

- Merge branch 'dev-0.2.7' ([`1bf7276`](https://github.com/rawfeed/rawfeed-jekyll/commit/1bf7276a695b7e1d00d0018b0156bfcaab8e588a))
- Correcting relative URL error (#5) ([`98777a8`](https://github.com/rawfeed/rawfeed-jekyll/commit/98777a85f6a2ec40d5a657abd20013e82bd41887))
- Adding url relative in items ([`ae532f8`](https://github.com/rawfeed/rawfeed-jekyll/commit/ae532f8d9326b4c3b9ab99a63d1faff00faa92ff))
- Adding url relative in items ([`971fb3f`](https://github.com/rawfeed/rawfeed-jekyll/commit/971fb3f72eeff81c3c4f90c910985b72f1514734))
- Merge pull request #9 from rawfeed/dev-0.2.7

Adding link for documentation ([`d45b4b5`](https://github.com/rawfeed/rawfeed-jekyll/commit/d45b4b50853cd1aa1e993c8447742b9b4785321c))
- Update ([`856ff06`](https://github.com/rawfeed/rawfeed-jekyll/commit/856ff061e942b13b8d24a0cbf0f0968e6dd20ee3))
- Merge pull request #8 from rawfeed/dev-0.2.7

Set default value for margin-bottom ([`51152f5`](https://github.com/rawfeed/rawfeed-jekyll/commit/51152f5afe91a8ade2c8501912273835458cae5c))
- Fixes creating a default margin-bottom (#6) ([`7d8327f`](https://github.com/rawfeed/rawfeed-jekyll/commit/7d8327f1b5bbdc8bfef4d17702d7eb7eeb8ac7cd))
- Adding cursor poinnter in links paginator ([`9117733`](https://github.com/rawfeed/rawfeed-jekyll/commit/9117733b102e7af3a9ac769059262863bd3d06a6))
- Adding spaces in counter text ([`471c85c`](https://github.com/rawfeed/rawfeed-jekyll/commit/471c85cf4c9014506c212393c00032da8561967a))
- Merge pull request #7 from rawfeed/dev-0.2.7

Fix: Fixes for missing `margin-bottom` (#6) ([`2eee719`](https://github.com/rawfeed/rawfeed-jekyll/commit/2eee719dc8f4de1d40463d41e368097752172ecf))
- Fixes for missing `margin-bottom` (#6) ([`57e4017`](https://github.com/rawfeed/rawfeed-jekyll/commit/57e4017e28d57ea82aad356b613a15a974d3a6e4))
- Update new version 0.2.7 ([`fdc593d`](https://github.com/rawfeed/rawfeed-jekyll/commit/fdc593d658cdf36f09df9cb9c4697dde84bece5a))
- Update ([`d376350`](https://github.com/rawfeed/rawfeed-jekyll/commit/d37635028064a1bcec5dd91a592eba8c65ede7ce))
- Update new logo ([`457ca7c`](https://github.com/rawfeed/rawfeed-jekyll/commit/457ca7c2e9bd574418772fdfa39fa13b2c28ecb5))
- Update ([`cbb391d`](https://github.com/rawfeed/rawfeed-jekyll/commit/cbb391d6d1a84034a20ebdf539d1c8d427f5754e))

## [v0.2.6] - 2025-10-31

### Miscellaneous

- Updaate version 0.2.6 ([`239ab6e`](https://github.com/rawfeed/rawfeed-jekyll/commit/239ab6ea9caa66549be198055ac34a7ba71a7f60))
- Fixes the bug where the pub.html layout is not found in the theme. (#5) ([`9080641`](https://github.com/rawfeed/rawfeed-jekyll/commit/9080641cd134829278813974e8918f9742cdf56b))

## [v0.2.5] - 2025-10-31

### Miscellaneous

- Add new feature to /pub/ (#5) ([`2f8d103`](https://github.com/rawfeed/rawfeed-jekyll/commit/2f8d10333619698a61848af27a01d54f786d5e39))
- Update version 0.2.5 ([`e3bfd6d`](https://github.com/rawfeed/rawfeed-jekyll/commit/e3bfd6d8c0f0e52744c7787369b0443680cfe937))

## [v0.2.4] - 2025-10-28

### Miscellaneous

- Changing to the new rawfeed logo ([`0ac162c`](https://github.com/rawfeed/rawfeed-jekyll/commit/0ac162c44995666a141aaafdc4f1a4a38176bdb1))
- Changing to the new rawfeed logo ([`2e60157`](https://github.com/rawfeed/rawfeed-jekyll/commit/2e6015793140fe2b2966b2a9d538f5cf7046be9b))
- Fixing bug where form was not found with condition. ([`d99b331`](https://github.com/rawfeed/rawfeed-jekyll/commit/d99b331b2e2f84db5870a664369640db2aafb7e6))
- Changing javascripts for fallback ([`80fdc98`](https://github.com/rawfeed/rawfeed-jekyll/commit/80fdc980eb91234a6e246b08309ca62cd322012b))
- Adding a new feature to customize the style. ([`8532ad9`](https://github.com/rawfeed/rawfeed-jekyll/commit/8532ad9af735f0299846a230096460f5ed771def))
- Adding new url for CSP ([`19fc88c`](https://github.com/rawfeed/rawfeed-jekyll/commit/19fc88c47ac9aa00608783da20c04d7b165b18b0))
- Update version 0.2.4 ([`a2b0853`](https://github.com/rawfeed/rawfeed-jekyll/commit/a2b08539cf14cc22cf71cceb90e48070138ec8f0))

## [v0.2.3] - 2025-10-28

### Miscellaneous

- Update version 0.2.3 ([`74e5a22`](https://github.com/rawfeed/rawfeed-jekyll/commit/74e5a2239c5249baa1784400f217c35e88ebc7b9))
- Bugfix. It's loading the _config.yml file instead of options.yml. ([`347b380`](https://github.com/rawfeed/rawfeed-jekyll/commit/347b38070620d288e473afd0586009ea8e72380d))
- Update version 0.2.3 ([`2cf1470`](https://github.com/rawfeed/rawfeed-jekyll/commit/2cf1470b4694e97f69736d5da5aa4afe34dbdfc8))

## [v0.2.2] - 2025-10-28

### Miscellaneous

- It's loading the _config.yml file instead of options.yml in the plugin datelang ([`30e0936`](https://github.com/rawfeed/rawfeed-jekyll/commit/30e0936c446c32b8a7b1b8fea1fcaaecb9a89e0e))
- Removing invalid character ([`e4af552`](https://github.com/rawfeed/rawfeed-jekyll/commit/e4af552f9e1d96482fb1f974883470f39151526f))
- Removing the line that changes the pager status. ([`e32e7cb`](https://github.com/rawfeed/rawfeed-jekyll/commit/e32e7cbf7b43295671aba55b060aaeeef92bbbd6))
- Update version 0.2.2 ([`5890228`](https://github.com/rawfeed/rawfeed-jekyll/commit/5890228af52f6d95c2ad89b6429bb7834f4e227b))

## [v0.2.1] - 2025-10-26

### Miscellaneous

- Update version 0.2.1 ([`d5eb604`](https://github.com/rawfeed/rawfeed-jekyll/commit/d5eb6041237d524e28571033995d037427e38d56))
- Update version 0.2.1 ([`79b8c0a`](https://github.com/rawfeed/rawfeed-jekyll/commit/79b8c0a221e57e63304c497227832992eac7a46b))
- Bug fix. Fixing URL bug. Adding relative_url. ([`96a1fff`](https://github.com/rawfeed/rawfeed-jekyll/commit/96a1fff275536f26f80121eed7474acf2731a27b))

## [v0.2.0] - 2025-10-26

### Miscellaneous

- Clean lines empty ([`a01078e`](https://github.com/rawfeed/rawfeed-jekyll/commit/a01078e464d4a89bbc86ae8e67dca5b4b603b584))
- Improving the structure ([`83fd8b2`](https://github.com/rawfeed/rawfeed-jekyll/commit/83fd8b243480225ef10915bfcba602bba2d49e7a))
- Applying constants from data.liquid and removing script ([`d6ea28c`](https://github.com/rawfeed/rawfeed-jekyll/commit/d6ea28c231935af4cddaf41757596254e8f480b6))
- Applying constants from data.liquid ([`19dc894`](https://github.com/rawfeed/rawfeed-jekyll/commit/19dc894e38e77fc1366659a433577389127dc798))
- Applying constants from data.liquid. ([`e1aa9da`](https://github.com/rawfeed/rawfeed-jekyll/commit/e1aa9dad25b308f635436877e3f24b80d5b7f4aa))
- Improving the menu structure, fixing bugs, and applying constants from data.liquid ([`8590ce1`](https://github.com/rawfeed/rawfeed-jekyll/commit/8590ce1b95de207258c676795488d39b0dd5bb86))
- Adding SEO, constants from data.liquid, Google fonts, and more. ([`c963172`](https://github.com/rawfeed/rawfeed-jekyll/commit/c963172105646355ef74292cc338f8de9a4749d7))
- Applying constant footer_ from data.liquid ([`a60ef0e`](https://github.com/rawfeed/rawfeed-jekyll/commit/a60ef0ef873f07d83ffc699cd7f32a080526f397))
- Using a single file to load constants in Liquid and Improving the terminal structure ([`f43b8ea`](https://github.com/rawfeed/rawfeed-jekyll/commit/f43b8ea72e5973f2024ec2587db980f735bce2a3))
- Implementing pixel layout ([`ba428ae`](https://github.com/rawfeed/rawfeed-jekyll/commit/ba428ae2bef942ec3d4f92c9b5005b9d74526c83))
- Using a single file to load constants in Liquid. ([`cebab55`](https://github.com/rawfeed/rawfeed-jekyll/commit/cebab553df159dfc75adea7d83bd9e0a263d63c9))
- Updating the style with new colors, layouts, fonts, etc. Version 0.2.0 ([`43199f6`](https://github.com/rawfeed/rawfeed-jekyll/commit/43199f6497119c35cd6ce80d93950c73ddf456e0))
- Updating the style with new colors, layouts, fonts, etc. Version 0.2.0 ([`1c65fa5`](https://github.com/rawfeed/rawfeed-jekyll/commit/1c65fa5f1ba1d31e45e3692b0158c3e6347cac20))
- Adding new color schemes ([`05ad9c7`](https://github.com/rawfeed/rawfeed-jekyll/commit/05ad9c70a9558803fb51b8ff6303080e6c1a6f39))
- Adding tag badges ([`4680191`](https://github.com/rawfeed/rawfeed-jekyll/commit/4680191195cda5f254ac00a08f553c596f210736))
- Adding pixel functionality #2 ([`f710351`](https://github.com/rawfeed/rawfeed-jekyll/commit/f71035195cec4ce8df5692dfa3c9d592137ac6f8))
- Renaming functions ([`2e91a24`](https://github.com/rawfeed/rawfeed-jekyll/commit/2e91a24f551a6daee26233b7fdc4e5e7f15566a0))
- Importing new features ([`50d3ea4`](https://github.com/rawfeed/rawfeed-jekyll/commit/50d3ea4f33d1b6496573825e33a0cabaec91cbd8))
- Adding author ([`595d9fc`](https://github.com/rawfeed/rawfeed-jekyll/commit/595d9fc2861c620c89fd7d3d5202f6081f79651a))
- Adding the path for the pixels posts ([`dc340af`](https://github.com/rawfeed/rawfeed-jekyll/commit/dc340af06ae29f0fb4616f0a77f09eb290483dd5))
- Updating to version 0.2.0 ([`bce8a31`](https://github.com/rawfeed/rawfeed-jekyll/commit/bce8a3136e41a3d8f7b7b429aa5a10513b2188a8))
- Adding comment ([`cd9fb89`](https://github.com/rawfeed/rawfeed-jekyll/commit/cd9fb89d958119cf31369a3f8cd04f35dff1f3ce))
- Adding the `with_class` plugin to add a CSS class to an element. ([`40656c4`](https://github.com/rawfeed/rawfeed-jekyll/commit/40656c4bb6ce7793ea978457a19d20700d71edf0))
- Adding TypeScript plugin ([`719cd69`](https://github.com/rawfeed/rawfeed-jekyll/commit/719cd699c6eed975295d2bc6168760811c7e6ac5))
- Adding license layout ([`678110b`](https://github.com/rawfeed/rawfeed-jekyll/commit/678110b118b586c5df209569355a571dcfd6317a))
- Adding a plugin to automatically update the author of the pages #4 ([`bd15fd7`](https://github.com/rawfeed/rawfeed-jekyll/commit/bd15fd7b7e447df62be2b9eef8c98f6067002a83))
- Adding .keep to keep the images/blog folder. ([`b0c7273`](https://github.com/rawfeed/rawfeed-jekyll/commit/b0c7273af27da944d800af0abeb52efd810582e6))
- Adding description for pages blog ([`62ffaef`](https://github.com/rawfeed/rawfeed-jekyll/commit/62ffaef1f296464b9df37b2ff456ef4cf5867bdc))
- Update example markdown ([`94879ac`](https://github.com/rawfeed/rawfeed-jekyll/commit/94879ac4675b3a317856f4da7be3a48119b8b079))
- Update example markdown ([`53eeb41`](https://github.com/rawfeed/rawfeed-jekyll/commit/53eeb41287480e744df7d6e6896adfdddc06e0bf))
- Adding new command for pixels layout ([`6fe1f68`](https://github.com/rawfeed/rawfeed-jekyll/commit/6fe1f68ea2888b10c2e800f3e9004500fff6c785))
- Update package.json ([`7ba5c54`](https://github.com/rawfeed/rawfeed-jekyll/commit/7ba5c541d46a14db001a125ca75745e788b355fc))
- Adding comment ([`2e14069`](https://github.com/rawfeed/rawfeed-jekyll/commit/2e140696c1e04ffd6508f8d058ae87e0160829fc))
- Update url for rawfeed org ([`390cfd2`](https://github.com/rawfeed/rawfeed-jekyll/commit/390cfd20b3c7efadfc8100ed536cb528b347a274))
- Updating website URL ([`11aa97a`](https://github.com/rawfeed/rawfeed-jekyll/commit/11aa97a79f381aaf522f123f0a3c3f1750538028))
- Update rawfeed.gemspec ([`5674690`](https://github.com/rawfeed/rawfeed-jekyll/commit/5674690ddaa93b31173caad28cc000a169297cba))
- Deleting useless file ([`505ed40`](https://github.com/rawfeed/rawfeed-jekyll/commit/505ed409f42f24ded18d8757173773c198838534))
- Adding pixels page ([`c097f31`](https://github.com/rawfeed/rawfeed-jekyll/commit/c097f31a325c0aea9a63a5e0a7a0d05e141ff5d1))
- Adding example image for pixel layout ([`4af9d24`](https://github.com/rawfeed/rawfeed-jekyll/commit/4af9d24fd0e50cb1a23404c1ced7462ac84fbf06))
- Adding javascript for the tasks runner ([`738e63a`](https://github.com/rawfeed/rawfeed-jekyll/commit/738e63ac69b1b443ad2fd3d40ed6a0022639d981))
- Adding JavaScript fallback files ([`a6cef9c`](https://github.com/rawfeed/rawfeed-jekyll/commit/a6cef9c06dcf9145f4fdbd2612f03cea0003a05b))
- Adding JavaScript to CoffeeScript. ([`1ca37d6`](https://github.com/rawfeed/rawfeed-jekyll/commit/1ca37d6d6f39c386c8a01f9d49c2de14537c51f8))
- Using a single file to load constants in Liquid. ([`c452596`](https://github.com/rawfeed/rawfeed-jekyll/commit/c452596940a8b91afa242dced3565479ed4ebae6))
- Converting JavaScript into single CoffeeScript files. ([`132a182`](https://github.com/rawfeed/rawfeed-jekyll/commit/132a182e5ef1c20195ccf25444f74c792e32d663))
- Using a single file to load constants in Liquid. ([`fb219f6`](https://github.com/rawfeed/rawfeed-jekyll/commit/fb219f640b8b95fd1108e3ad3c22f25717333fad))
- Using a single file to load constants in Liquid. ([`aeae92e`](https://github.com/rawfeed/rawfeed-jekyll/commit/aeae92e600e228b6c78d967da628e7eb29b30cab))
- Adding NEW pixels layout #1 ([`337e4db`](https://github.com/rawfeed/rawfeed-jekyll/commit/337e4dbbaf8e1c4654398d11eb0b5e737dd34bd5))
- Update versions dependencies ([`803624e`](https://github.com/rawfeed/rawfeed-jekyll/commit/803624e53c5214d391d09dc86edc9c7e97be778c))
- Adding _options.yml. Much of what was in _config.yml is now here. ([`9a20c9c`](https://github.com/rawfeed/rawfeed-jekyll/commit/9a20c9c68fdb6664a7c6c8ef9f97336326eaaa9f))
- Moving to a page on the organization's website. ([`695fd89`](https://github.com/rawfeed/rawfeed-jekyll/commit/695fd897c63f2f9fdc15c3739cc70ada6508394a))
- Converting JavaScript to CoffeeScript. ([`dc3d9dd`](https://github.com/rawfeed/rawfeed-jekyll/commit/dc3d9dd6c4435a83362630f25fb8a6c3d9c6185b))
- Using a separate directory for the starter project. ([`4238b05`](https://github.com/rawfeed/rawfeed-jekyll/commit/4238b05901061ae98ab15885ac19e5dfad1b3cf5))
- Using Node.js and packages for task runners. ([`644f60d`](https://github.com/rawfeed/rawfeed-jekyll/commit/644f60dcd1eb90fda6ba7644de15c0f0f262df1b))
- Moving settings to _data/options.yml ([`6feae2e`](https://github.com/rawfeed/rawfeed-jekyll/commit/6feae2e67e3709e85b13ce1abdc590a1ec324bb5))
- Update README.md ([`9fb24ba`](https://github.com/rawfeed/rawfeed-jekyll/commit/9fb24ba98988c6b5476505c5b21390118b2e3571))
- Update config .vscode ([`bab14a5`](https://github.com/rawfeed/rawfeed-jekyll/commit/bab14a53dbd7c5ac2c784f05b87fb3bb37ec5e68))
- Changing license to CC BY 4.0 ([`3f94bb4`](https://github.com/rawfeed/rawfeed-jekyll/commit/3f94bb4fba82557d4fd1b338888a96ba95bc8a3a))
- Adding comments ([`e556242`](https://github.com/rawfeed/rawfeed-jekyll/commit/e556242154c5b4f321bcc47c44ed42d5210d49bf))

## [v0.1.4] - 2025-10-15

### Miscellaneous

- Update ([`3dfcb02`](https://github.com/rawfeed/rawfeed-jekyll/commit/3dfcb0286d21d30080b93949b5a933c7ed0916c4))
- Removing TODO ([`9414a11`](https://github.com/rawfeed/rawfeed-jekyll/commit/9414a113c3fcf7bdadcb3d4eefe81161865352a0))
- Removing TODO ([`1c92d16`](https://github.com/rawfeed/rawfeed-jekyll/commit/1c92d16a78e327a669150f3b054459a3218c0916))
- Changing the value of site.text to site.strings in _config.yml ([`5384fcd`](https://github.com/rawfeed/rawfeed-jekyll/commit/5384fcddda289f9c16e6b37815ec6262741f2eec))
- Changing the value of site.text to site.strings in _config.yml ([`1cec9d7`](https://github.com/rawfeed/rawfeed-jekyll/commit/1cec9d779e3c2500e8c0a64cc54ee36f9e025387))
- Update ([`f442b07`](https://github.com/rawfeed/rawfeed-jekyll/commit/f442b0722e9ce84e03811aa04c606936cc223d40))
- Adding emoji to menu and CSP security ([`f9ba0d9`](https://github.com/rawfeed/rawfeed-jekyll/commit/f9ba0d9f7ddaeb4c231d04f3417a86ff16066d19))
- Correction in different layouts ([`aade3e6`](https://github.com/rawfeed/rawfeed-jekyll/commit/aade3e6c3132e07065a4eb2525c8cb42a001a1ab))
- Removing useless code ([`a390400`](https://github.com/rawfeed/rawfeed-jekyll/commit/a3904001ba43a80e3d8c6cc16f848c704dd9c7df))
- Adding TODO ([`fafb745`](https://github.com/rawfeed/rawfeed-jekyll/commit/fafb745e8dc2a7e02d1a51da8d63c2a284d57f09))
- Adding new examples ([`2af5aae`](https://github.com/rawfeed/rawfeed-jekyll/commit/2af5aae36773f66c3015c32e40ea1b2bcff33a15))
- Adding emoji option to menu ([`60ab6e6`](https://github.com/rawfeed/rawfeed-jekyll/commit/60ab6e6ebfc9c4d8ddf074ce0d5dd6b0a303956f))
- Correction in different layouts ([`f1fe098`](https://github.com/rawfeed/rawfeed-jekyll/commit/f1fe0980523ade22152f20c7f00a04c852d60e0a))
- Improving script ([`be176b2`](https://github.com/rawfeed/rawfeed-jekyll/commit/be176b22a255460f984680a90c488c86484f17f6))
- Adding emoji option to menu ([`9338ffb`](https://github.com/rawfeed/rawfeed-jekyll/commit/9338ffb53c5b339a9859b5a13082cb7c5ce9f0d9))
- Removing because it was merged with include toc ([`c90abbb`](https://github.com/rawfeed/rawfeed-jekyll/commit/c90abbb615d4c8515a0a97ade6cfa72db8bd87b4))
- Update ([`7b8f5bb`](https://github.com/rawfeed/rawfeed-jekyll/commit/7b8f5bb5afe7eef057b79fddef3b3e449bdb142a))
- Adding layout pixels ([`e58f068`](https://github.com/rawfeed/rawfeed-jekyll/commit/e58f0682c67a20f17dcc5f249714063d1092ee31))
- Update ([`937aba4`](https://github.com/rawfeed/rawfeed-jekyll/commit/937aba452f6916e11195ba0fec3b69d550aa40e1))
- Update ([`78aea2c`](https://github.com/rawfeed/rawfeed-jekyll/commit/78aea2cd3db83ddc4733b454295a97d1558626b5))
- Adding TODO ([`0f72607`](https://github.com/rawfeed/rawfeed-jekyll/commit/0f72607de75f233be5bb84c617ed3b69577f4758))
- Adding include to capture inline script and generate hash for CSP ([`0bea050`](https://github.com/rawfeed/rawfeed-jekyll/commit/0bea0508e2b139a2751c11641c56befd9d256b2a))
- Adding plugin for SHA256 hash and encodes it in Base64, ready for use in a CSP ([`1e647a5`](https://github.com/rawfeed/rawfeed-jekyll/commit/1e647a52dbf012fea332cf60aeef2ada19c93e02))
- Import csp_filters.rb ([`b0a6683`](https://github.com/rawfeed/rawfeed-jekyll/commit/b0a66835203fb577891299c5986124978ae23104))
- Changing url YouTube video in post ([`75e497c`](https://github.com/rawfeed/rawfeed-jekyll/commit/75e497c427d2d0df49f1483b4e5a9e2329589290))
- Adding option in_menu ([`eef704e`](https://github.com/rawfeed/rawfeed-jekyll/commit/eef704eb21d9badbb6f156e76fa70681d12e9c02))
- Replacing area-hidden with inert ([`3634fc7`](https://github.com/rawfeed/rawfeed-jekyll/commit/3634fc7cb3c18de80a97f4d20cf8e8b26aa62711))
- Fixing lang in html ([`7324ec5`](https://github.com/rawfeed/rawfeed-jekyll/commit/7324ec56a2b1a06b16a49e2c5ef23a02f55267a7))
- Adding condition in_menu verification ([`634931a`](https://github.com/rawfeed/rawfeed-jekyll/commit/634931a89235159b646059c13c719af82b8a3294))
- Add CSP Security Section ([`3b00994`](https://github.com/rawfeed/rawfeed-jekyll/commit/3b009945183659b88d4869881cc6a2b81073b3a4))
- Removing frame-ancestors 'none' and adding dynamic urls in _config.yml ([`5af3ef8`](https://github.com/rawfeed/rawfeed-jekyll/commit/5af3ef8e55e42a55984451fc8a28a070cb5857d6))
- Removing area-hidden and adding inert ([`a77dbb4`](https://github.com/rawfeed/rawfeed-jekyll/commit/a77dbb4a8abb90e8631b939ec3f6dbdca04fd31c))
- Change link gem ([`a8d4e7c`](https://github.com/rawfeed/rawfeed-jekyll/commit/a8d4e7ca024420a7c67e2e7bf8c0e47af90c6507))
- Update ([`bae3953`](https://github.com/rawfeed/rawfeed-jekyll/commit/bae39531fc83c4970599f6c345c8791ebfe56479))
- Fixing lang error in html ([`f4c9ec7`](https://github.com/rawfeed/rawfeed-jekyll/commit/f4c9ec7ba974a2b3c902b16a1bf05abc77f218d6))
- Update ([`45bd6e9`](https://github.com/rawfeed/rawfeed-jekyll/commit/45bd6e9d1385343118bd9ffcd8a9cb2ecccd77cd))
- Adding an in_menu option to pages. ([`68d9fbf`](https://github.com/rawfeed/rawfeed-jekyll/commit/68d9fbffe67ffb47d895c0d252fe14fbb98692d6))
- Improving color contrast ([`9295940`](https://github.com/rawfeed/rawfeed-jekyll/commit/929594003e396e161bd7f4d5d62116dded7f9a46))
- Adding default avatar size ([`3cf13d0`](https://github.com/rawfeed/rawfeed-jekyll/commit/3cf13d0e28218ec01f41fcc57e3f4af74f2ab9db))
- Adding bootstrap.bundle.min.js ([`0e828ca`](https://github.com/rawfeed/rawfeed-jekyll/commit/0e828ca1c25e8950e8a84c5a1c5dea5cefd1ab3e))
- Removing width from html in avatar, and using it in css ([`bfa569a`](https://github.com/rawfeed/rawfeed-jekyll/commit/bfa569adcb11f544574c3f56fbf0232db8782123))
- Adding "http-equiv" security tag to website ([`8a2ee94`](https://github.com/rawfeed/rawfeed-jekyll/commit/8a2ee942ed0126d23ef9655c25f94e73bb86ec18))
- Update ([`8962f6b`](https://github.com/rawfeed/rawfeed-jekyll/commit/8962f6badbddedf5af15e8fc468a2e7ab02d7e57))
- Fixing lang bug in "html" tag ([`15ba447`](https://github.com/rawfeed/rawfeed-jekyll/commit/15ba44773e94e68b42fa29a7325985a268aa95a6))
- Removing unused documentation ([`dbd6127`](https://github.com/rawfeed/rawfeed-jekyll/commit/dbd6127a8f8a5155218155c14a0afe8262961c26))
- Update new version 0.1.4 ([`fe3062c`](https://github.com/rawfeed/rawfeed-jekyll/commit/fe3062cab015d215f78aad48349f9764e7be3f5a))
- Adding automatic current date (year) and "since" date function ([`ca299a7`](https://github.com/rawfeed/rawfeed-jekyll/commit/ca299a743a69340b066ba817cab5bb237058f4a6))
- Update new version 0.1.4 ([`d8f9c17`](https://github.com/rawfeed/rawfeed-jekyll/commit/d8f9c17714ef521d1d5764313faea95ec06b98f1))
- Update new version 0.1.4 ([`e271d20`](https://github.com/rawfeed/rawfeed-jekyll/commit/e271d200969e15f91282115e211f9d301bf364bf))
- Update ([`f04f928`](https://github.com/rawfeed/rawfeed-jekyll/commit/f04f9280de80b48b4e729d25aa7feb19c1a720a9))
- Copyright modification, adding since ([`2110912`](https://github.com/rawfeed/rawfeed-jekyll/commit/211091219f026b28aea9c1ec6f6558928a327aae))
- Datelang format correction and copyright modification ([`691f569`](https://github.com/rawfeed/rawfeed-jekyll/commit/691f5690593ec073acc5a1fcf3063c32a4295789))
- Fixing details error. The arrow is not rotating 90deg ([`d3ab62c`](https://github.com/rawfeed/rawfeed-jekyll/commit/d3ab62c5370ca700004fc7972bc9b215dfd711bd))
- Removing TODO ([`29f1f7e`](https://github.com/rawfeed/rawfeed-jekyll/commit/29f1f7e26d95e2ea53acfa57dfc0766e7ff81d84))
- Removing page break property when printing ([`15c0367`](https://github.com/rawfeed/rawfeed-jekyll/commit/15c0367267bb7b134ba68aeb3afbbda6f8210f04))
- Adding strong to courses ([`2d018f4`](https://github.com/rawfeed/rawfeed-jekyll/commit/2d018f4938cfd49c7203c59d8808e1c723ff8a2c))

## [v0.1.3] - 2025-10-14

### Miscellaneous

- Change TODO ([`0a2a069`](https://github.com/rawfeed/rawfeed-jekyll/commit/0a2a069c80a5c60c8049bd7405f63abf4e4c1ae4))
- Remove comment trash ([`21b89dc`](https://github.com/rawfeed/rawfeed-jekyll/commit/21b89dcb259d7e3265e8c38bcd202f1fa83bb85d))
- It was not recognizing Portuguese language abbreviations properly ([`6598f0c`](https://github.com/rawfeed/rawfeed-jekyll/commit/6598f0c7d78451e45d6a34b786b380fae9a9c646))
- Remove TODO ([`eb9144e`](https://github.com/rawfeed/rawfeed-jekyll/commit/eb9144e230c58b2226a3bbb64731fc03ee78236f))
- Update new version ([`5d9d890`](https://github.com/rawfeed/rawfeed-jekyll/commit/5d9d89004f2111a612489a9309ccebdf05a8b0fe))
- Update date format to  %d ([`8b83b3f`](https://github.com/rawfeed/rawfeed-jekyll/commit/8b83b3f265a93dbc7dc57200578d44c1bd830871))
- TODO adding ([`fb7f163`](https://github.com/rawfeed/rawfeed-jekyll/commit/fb7f1635c401c0566f16b53bdf0beb9bebb0ad60))
- Update new version 0.1.3 ([`a696697`](https://github.com/rawfeed/rawfeed-jekyll/commit/a6966973962823e3e9648a9da1ba33219f10ee1d))
- Update ([`752c329`](https://github.com/rawfeed/rawfeed-jekyll/commit/752c3295997c17fdbeefe34495298d847d57db22))

## [v0.1.2] - 2025-10-14

### Miscellaneous

- Change name modules ([`6b20ffb`](https://github.com/rawfeed/rawfeed-jekyll/commit/6b20ffbe173059b62ec029a0c988b761530e07f1))
- Update ([`b5b439b`](https://github.com/rawfeed/rawfeed-jekyll/commit/b5b439bf2e23040af0221d89690530785dc75641))
- New feature: datelang and reading_time in posts and pages ([`7326e86`](https://github.com/rawfeed/rawfeed-jekyll/commit/7326e86d30de08eafa50a960d725f3b7d1e6f6b2))
- Adding option for reading_time plugin ([`2f7de6b`](https://github.com/rawfeed/rawfeed-jekyll/commit/2f7de6b7c3692e73534da28c69c3eaa6f8935f05))
- Adding reading_time plugin ([`38174e7`](https://github.com/rawfeed/rawfeed-jekyll/commit/38174e7801d93f5e6b276722d36f1342722fba51))
- Adding datelang plugin ([`63d9bea`](https://github.com/rawfeed/rawfeed-jekyll/commit/63d9beaaf4c44638b6dc6fa4b8f189b9f6f302dd))
- Importing datelang and reading_time ([`f7aa23c`](https://github.com/rawfeed/rawfeed-jekyll/commit/f7aa23c5b7dd5e6721ca2c373bca1000ff6d27f7))
- Adding new sections ([`1a67553`](https://github.com/rawfeed/rawfeed-jekyll/commit/1a67553ea3ea2c9667e7265b0fd5fbb627bf3959))
- Update version to 0.1.2 ([`3fbddcf`](https://github.com/rawfeed/rawfeed-jekyll/commit/3fbddcf5eec866369d04564f58f37cf92431b424))
- Add more languages ​​to datelang plugin ([`2aff8da`](https://github.com/rawfeed/rawfeed-jekyll/commit/2aff8da81e8c0c641fcf2c2281e489fc8a65004a))
- Adding style to reading_time and others styles ([`4242e30`](https://github.com/rawfeed/rawfeed-jekyll/commit/4242e30779a4627114a2b833dbb2373828f61ac4))
- Adding reading_time config ([`238fe91`](https://github.com/rawfeed/rawfeed-jekyll/commit/238fe91f0aa33bb2be791220b1d782005217c7f3))
- Adding style to reading_time ([`bc0cefa`](https://github.com/rawfeed/rawfeed-jekyll/commit/bc0cefad01096338b638a121bfce0224efe386d4))
- Improving style ([`2287af4`](https://github.com/rawfeed/rawfeed-jekyll/commit/2287af4c8e86ef914c94790759d4597698235b34))
- Adding option reading_time ([`ac027c2`](https://github.com/rawfeed/rawfeed-jekyll/commit/ac027c2f8fe0a1181bcbb95a76baefc3785d2f3b))
- Adding variable for datelang plugin ([`3c10a28`](https://github.com/rawfeed/rawfeed-jekyll/commit/3c10a28a19364544e52c6422fb6fec4eae412bbb))
- Update version 0.1.2 ([`9028314`](https://github.com/rawfeed/rawfeed-jekyll/commit/9028314ffc044480190a47a3bb04f9ca275c4a47))
- Update ([`aa73334`](https://github.com/rawfeed/rawfeed-jekyll/commit/aa73334eb0af8adb33d8b16e6cfedde9f0afb394))
- New sections added, including "datelang" and "Reading time" ([`3a0115e`](https://github.com/rawfeed/rawfeed-jekyll/commit/3a0115e86b8dfe8b5e73ebbb8a166e6bc6a3fd5d))
- Adding group "jekyll_plugins" in comment ([`b569f0f`](https://github.com/rawfeed/rawfeed-jekyll/commit/b569f0f1e2894795029320ebf606670d156d568b))
- Removing junk file ([`ff39886`](https://github.com/rawfeed/rawfeed-jekyll/commit/ff39886bb04a9780b723941ffe4c63ee96f3ce85))
- Adding config for plugin datelang ([`0154816`](https://github.com/rawfeed/rawfeed-jekyll/commit/01548166e3233a510903044bc5a3fc00a20393c5))
- Adding plugin datalang ([`610a632`](https://github.com/rawfeed/rawfeed-jekyll/commit/610a63211fc59c940fa000628dc9d2fc0fcb2ccc))
- Update ([`2e4b564`](https://github.com/rawfeed/rawfeed-jekyll/commit/2e4b56404ffaa79ff15539195503194ef75a6737))
- Removing dirty code ([`c332357`](https://github.com/rawfeed/rawfeed-jekyll/commit/c332357b2a2b10da77d619d6c6b7edd8232c197b))
- Fixing list errors ([`3115791`](https://github.com/rawfeed/rawfeed-jekyll/commit/3115791fd454728ed5575054fcd0fac530193228))
- Fixing table error, applying reset ([`6c80e48`](https://github.com/rawfeed/rawfeed-jekyll/commit/6c80e485ba1a37d629990ca5721b2aa09ab2591a))
- Adding new examples ([`a1b7056`](https://github.com/rawfeed/rawfeed-jekyll/commit/a1b705693fb63ca767c0542f60658e643eb03429))
- Creating a sample page ([`20a50f8`](https://github.com/rawfeed/rawfeed-jekyll/commit/20a50f8941855301eefc11df41e5d3dd1991d881))
- Adding TOC script to page ([`3d889e1`](https://github.com/rawfeed/rawfeed-jekyll/commit/3d889e1d9ea93f574fb6992f838dc679cf2f3573))
- Adding .page-content selector ([`08f0d12`](https://github.com/rawfeed/rawfeed-jekyll/commit/08f0d1278293aa8565e09f9925b8fc70f82e2695))
- Fixing date error in draft and page frontmatter ([`1553e3c`](https://github.com/rawfeed/rawfeed-jekyll/commit/1553e3ce9b502e1fd10c3df54a57e84178b81e1d))
- Improving styling ([`94e9185`](https://github.com/rawfeed/rawfeed-jekyll/commit/94e918503cfaab1e7355ae16e4e4f6ea5c8c5254))
- Update post example ([`541b221`](https://github.com/rawfeed/rawfeed-jekyll/commit/541b22130ab20ef3f3b1f9304c3061a71e6a41d8))
- Adding a new Notes section ([`f3735ca`](https://github.com/rawfeed/rawfeed-jekyll/commit/f3735ca0ded7ab870013bf2155d1aed4280ec5c0))
- Adding section Certificates ([`03c40fc`](https://github.com/rawfeed/rawfeed-jekyll/commit/03c40fc3224081937739cf7376ca5609d38a68aa))
- Adding section Certificates ([`f836e07`](https://github.com/rawfeed/rawfeed-jekyll/commit/f836e07fc295341e5874484d9a4c1ea2cdd7c526))
- Update ([`e464669`](https://github.com/rawfeed/rawfeed-jekyll/commit/e464669756c110c3f642c8f93ddd816feda764f8))
- Update rawfeed  to 0.1.2 ([`013fed1`](https://github.com/rawfeed/rawfeed-jekyll/commit/013fed14d4278d776b51e580511b33aa31e7472a))
- Update ([`ab75908`](https://github.com/rawfeed/rawfeed-jekyll/commit/ab7590870659dbd6be8f6266a8619e2fb8c6bd79))
- Update README.md ([`f77a025`](https://github.com/rawfeed/rawfeed-jekyll/commit/f77a0251cf740ae8f94f63bbccb1c1ba351bbf57))
- Adding .editorconfig ([`cc99158`](https://github.com/rawfeed/rawfeed-jekyll/commit/cc991587c98f1143b9e20b9ba622e387dd6ad4df))
- Adding version RubyGems ([`5c92f2d`](https://github.com/rawfeed/rawfeed-jekyll/commit/5c92f2d8bcd734033ee14aaa194a1bfd3c959fe1))
- Update version 0.1.2 ([`315c2bd`](https://github.com/rawfeed/rawfeed-jekyll/commit/315c2bd9189e3bc8555bacf4b4fc5149c38698e1))
- Update CHANGELOG.md ([`ccfc461`](https://github.com/rawfeed/rawfeed-jekyll/commit/ccfc461d7f6157300f5b388355b2b8f18f04a063))
- Update ([`2434b9a`](https://github.com/rawfeed/rawfeed-jekyll/commit/2434b9ad9756704a42b95468c9da46d52edef8dd))
- Fixing video include url bug ([`d8143d6`](https://github.com/rawfeed/rawfeed-jekyll/commit/d8143d6e48fc4c773c8a1ca349cef03ea44467f8))
- Update README.md ([`f1a9b37`](https://github.com/rawfeed/rawfeed-jekyll/commit/f1a9b378147bdce579deef7a048161a75e12e22c))

## [v0.1.1] - 2025-10-12

### Miscellaneous

- Update new version 0.1.1 ([`6ec2027`](https://github.com/rawfeed/rawfeed-jekyll/commit/6ec20273af47bd41c0e883810c0dc75e3d72e838))
- Addressing scriptt case does not find id ([`cd9b3e3`](https://github.com/rawfeed/rawfeed-jekyll/commit/cd9b3e3259c6267147d783b80b7b005d353b4f6b))
- Adding min-width to TOC ([`06aec25`](https://github.com/rawfeed/rawfeed-jekyll/commit/06aec259bbcbb40438d048102fc7308a790547f3))
- Update CHANGELOG.md ([`bfaeb82`](https://github.com/rawfeed/rawfeed-jekyll/commit/bfaeb824607dc37d0f86b71c221f98714e3a7616))
- Deleting blog_search.js and passing code through html ([`37bec48`](https://github.com/rawfeed/rawfeed-jekyll/commit/37bec481231a548d270aad65ac9d75248af70f70))
- Include news urls ([`43963a4`](https://github.com/rawfeed/rawfeed-jekyll/commit/43963a4d0b777143dfa4a11f22b4f4d7cff7f6a4))
- Fixing new urls for baseurl ([`e38a959`](https://github.com/rawfeed/rawfeed-jekyll/commit/e38a9597d26f6d4e4afd7d226161d16f635aab7d))
- Adding fixed urls for the entire site ([`d16ab9c`](https://github.com/rawfeed/rawfeed-jekyll/commit/d16ab9cef4d9cfe9401a5b52f669bb06f507282d))
- Removing trash ([`0a9cdb3`](https://github.com/rawfeed/rawfeed-jekyll/commit/0a9cdb3f5525be76b6e467e94510fed17b120b00))
- Fixing URL error: adding prepend ([`9baed3f`](https://github.com/rawfeed/rawfeed-jekyll/commit/9baed3fef8e0e3f1644a277d7918bc7e15320737))
- Fixing title error ([`55af2dd`](https://github.com/rawfeed/rawfeed-jekyll/commit/55af2ddc8acb64dfa9ec174d36873e61e01c83cf))
- Update new version 0.1.1 ([`902f10d`](https://github.com/rawfeed/rawfeed-jekyll/commit/902f10dc9fa5af64ceee12e816d80753587d3724))
- Update CHANGELOG.md ([`4dcabe7`](https://github.com/rawfeed/rawfeed-jekyll/commit/4dcabe7fccb266a527cb60ec4416eeb6a7c08182))
- Fixing installation url ([`9ea92a1`](https://github.com/rawfeed/rawfeed-jekyll/commit/9ea92a11911c19d38f7dd4f253a01ac7584d7ad1))
- Update function show_menu, adding command 'npm run help' ([`e39bf12`](https://github.com/rawfeed/rawfeed-jekyll/commit/e39bf12139b48935f9ec54451a19a27937fd24e1))

## [v0.1.0] - 2025-10-12

### Miscellaneous

- Information menu update ([`29e6458`](https://github.com/rawfeed/rawfeed-jekyll/commit/29e6458697d2448a91bd19a9933e30da205884e1))
- Update README.md ([`11f27c1`](https://github.com/rawfeed/rawfeed-jekyll/commit/11f27c19e2251e14b90faec8c731e8bec7582db5))
- First update: version 0.1.0 ([`c098ce0`](https://github.com/rawfeed/rawfeed-jekyll/commit/c098ce097428928ae431938e8bfb1aec0d4319d7))


