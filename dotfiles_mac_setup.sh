#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    export PATH="/usr/local/bin:$PATH"
fi

fancy_echo "Updating Homebrew formulae ..."
brew update --force # https://github.com/Homebrew/brew/issues/1151

fancy_echo "Installing Homebrew packages ..."
brew bundle --file=- <<EOF
# tap "thoughtbot/formulae"
# tap "homebrew/services"

# Unix
# tap "universal-ctags/universal-ctags"
# brew "universal-ctags", args: ["HEAD"]

# Heroku
tap "heroku/brew"
brew "heroku/brew/heroku"

tap "puma/puma"
brew "puma/puma/puma-dev"

brew "git"
brew "gh"
brew "imagemagick@6"

brew "rcm"
brew "the_silver_searcher"
brew "tmux"

# Programming language prerequisites and package managers
# brew "libyaml" # should come after openssl
# brew "coreutils"
# brew "yarn"

brew "direnv"
brew "htop"
brew "postgis"
brew "nmap"
brew "m-cli"
brew "bash-completion"
brew "nvim"
brew "bash-git-prompt"
brew "gnupg"
brew "yarn"
EOF

fancy_echo "Installing Homebrew CASK packages ..."
brew bundle --file=- <<EOF
# cask "gpg-suite"
# cask "karabiner-elements"
# cask "iterm2"
# cask "fork"
# cask "atom"

# cask "google-chrome"
# cask "pgadmin4"
# cask "gimp"
# cask "skype"
# cask "disk-inventory-x"

# cask "docker"
# cask "slack"
# cask "android-studio"

# brew "homebank" # should be a cask but it is a brew
# cask "teamviewer"
# cask "vnc-viewer"
EOF

fancy_echo "preparing dotfiles..."
git clone https://github.com/formigarafa/dotfiles.git ~/.dotfiles

rcup -v

# install terminal font
fancy_echo "downloading terminal nerd-font..."
curl -o ~/Library/Fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono.ttf https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf

# setting up tmux
fancy_echo "setting up tmux..."
git -C ~/.tmux/plugins/tpm pull || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh

fancy_echo "setting up vim..."
curl -sLf https://spacevim.org/install.sh | bash

fancy_echo "Setting up puma-dev"
sudo puma-dev -setup
puma-dev -install
# this might be required
# security add-trusted-cert -k login.keychain-db ~/Library/Application\ Support/io.puma.dev/cert.pem

# comment the following line on /etc/hosts to avoid issues with ipv6 and rails on puma-dev
# ::1             localhost

fancy_echo "Setting up asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

fancy_echo "A few adjustments on mac dock"
m dock prune
m dock magnification YES
m dock autohide YES

cat <<EOF
# Last touches

# ITerm2 settings (manual step):
# Open menu Iterm2 > Preferences
# Got to Tab Profiles > Text
# Select Font: "SauceCodePro Nerd Font Mono" and set size to 14

# keyboard setup
# open preferences keyboard
# set key repeat to fast
# set delay until repeat to short

# dock
# open prefereces > dock
# set size to 1/4
# set magnification to 1/2
# Disable "Show recent applications in Dock"

# tmux caps-lock setup
# Open Karabiner-Elements
# Authorize what is required
# open Karabiner Preferences and add Simple modification: caps_lock -> F18
# go to "misc" tab and disable "Show icon in menu bar"
# go to System Preferences --> Keyboard --> Modifier Keys
# set Caps Lock Key to "No Action"

# install xcode to be ready to go
EOF
