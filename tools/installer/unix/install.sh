#!/bin/sh
# :: installer for Unix ::
# uninstall: curl -fsSL https://williamcanin.github.io/install/rawfeed | sh -s -- --uninstall

SCRIPT_NAME=$(basename "$0")
THEME_NAME="rawfeed"

msg_reply () {
  printf "\e[0;36m→ %s\e[0m$2" "$1"
}

msg_header () {
  printf "\e[0;36m→ %s\e[0m$2" "$1"
}

msg_finish () {
  printf "\e[0;32m✔ %s\e[0m\n" "$@"
}

msg_warning () {
  printf "\e[0;33m⚠ %s\e[0m\n" "$@"
}

msg_error () {
  printf "\e[0;31m✖ %s\e[0m\n" "$@"
}

check_user () {
  [ "$(id -u)" -eq "$1" ] && { msg_error "You cannot use this feature with this user ($(whoami))"; exit 1; }
}

check_dir() {
  if find . -maxdepth 1 -mindepth 1 -not -name "$SCRIPT_NAME" | grep -q .; then
    msg_error "The current directory is not empty. The installation must be performed in an empty directory."
    exit 1
  fi
}

check_dependencies() {
  if [ ! -x "$(which ruby)" ]; then
    msg_error "Ruby not found. Please install Ruby!"
    exit 1
  fi
  if [ ! -x "$(which git)" ]; then
    msg_error "Git not found. Please install Git!"
    exit 1
  fi
  if [ ! -x "$(which gem)" ]; then
    msg_error "Gem not found. Please install Gem!"
    exit 1
  fi
  if [ ! -x "$(which npm)" ]; then
    msg_error "NPM not found. Please install NPM!"
    exit 1
  fi
}

gem_bundle_install() {
  msg_header "Installing dependencies from \"$THEME_NAME\"..." "\n"
  if [ -f "Gemfile" ]; then
    gem install bundler
    bundle install
  else
    msg_error "Gemfile file not found. Aborted!"
    exit 1
  fi
  msg_finish "$THEME_NAME dependencies installed!"
}

npm_install() {
  msg_header "Installing optimization dependencies (node_modules)..." "\n"
  if [ -f "package.json" ]; then
    npm install
  else
    msg_error "Package.json file not found. Aborted!"
    exit 1
  fi
  msg_finish "Optimization dependencies installed!"
}

starter() {
  sed_inplace_extension=""

  if [ "$(uname)" = "Darwin" ]; then
    sed_inplace_extension="''"
  fi

  msg_header "Creating a \"$THEME_NAME\" template..." "\n"

  git clone -b main --single-branch "https://github.com/williamcanin/${THEME_NAME}.git"

  for f in ./"$THEME_NAME"/tools/starter/* ./"$THEME_NAME"/tools/starter/.[!.]* ./"$THEME_NAME"/tools/starter/..?*; do
    [ -e "$f" ] || continue
    cp -a -- "$f" .
  done

  rm -rf ./"$THEME_NAME"

  echo
  msg_reply "Enter your website's hostname and protocol [E.g.: https://yoursite.com]:" "\n> "
  read -r url </dev/tty

  sed -i $sed_inplace_extension "s|^url: .*|url: \"$url\"|g" _config.yml
  sed -i $sed_inplace_extension "s|site|$url|g" CNAME
  sed -i $sed_inplace_extension "s|# site|# $url|g" README.md

  msg_finish "$THEME_NAME template created!"
}

choice_ci() {
  while true; do
    msg_reply "Which CI/CD do you use?" "\n"
    echo "1 - GitHub"
    echo "2 - GitLab"
    echo "3 - Both"
    echo "4 - Neither"
    msg_reply "> " ""
    read -r reply </dev/tty

    case "$reply" in
      "1")
        rm -f .gitlab-ci.yml
        break
      ;;
      "2")
        rm -rf .github/
        break
      ;;
      "3")
        _
        break
      ;;
      "4")
        rm -rf .github/ .gitlab-ci.yml
        break
      ;;
     *)
      msg_warning "Invalid option: $reply. Please enter 1, 2, 3 or 4."
      ;;
    esac
  done
  msg_finish "CI/DC setup complete!"
}

show_menu() {
  echo
  npm run help
  msg_warning "Configure the \"_config.yml\" file as you like."
  msg_warning "For more information, read: README.md"
}

main() {
  check_user 0
  check_dir
  check_dependencies
  starter
  gem_bundle_install
  choice_ci
  npm_install
  show_menu
}

case "$1" in
  --uninstall)
    # Usage: curl -fsSL https://.../install.sh | sh -s -- --uninstall
    msg_header "Uninstallation..." "\n"
    find . -maxdepth 1 -mindepth 1 -not -name "$SCRIPT_NAME" -exec rm -rf {} +
    msg_finish "Uninstallation complete!"
  ;;
  *)
    main
  ;;
esac
exit 0
