#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
WHITE="\033[37m"
NORMAL="\033[0;39m"

printf "\n${WHITE}==============================================================================

Getting Ready to Setup New OS Device.....

==============================================================================${NORMAL}\n"

# Fix macOS Mojave antialiased fonts
# printf "\n${MAGENTA}Fixing Mojave fonts to look normal again...${NORMAL}\n"
# eval "defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO"

# Show hidden dotfiles in finder
printf "\n${MAGENTA}Showing hidden files to be visible finder...${NORMAL}\n"
eval "defaults write com.apple.finder AppleShowAllFiles YES"
eval "killall Finder"

# Install XCode Command Line Tools
printf "\n${BLUE}Installing XCode Command Line Tools...${NORMAL}\n"
eval "xcode-select --install"

# Install Homebrew for easier macOS package management
printf "\n${YELLOW}Installing Homebrew...${NORMAL}\n"
eval '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

# If this is an M1 mac
if [[ `uname -m` == 'arm64' ]]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "/Users/$USER/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install Yarn for easier (and faster) Node.js dependency management
printf "\n${BLUE}Installing Yarn for easier (and faster) Node.js dependency management...${NORMAL}\n"
eval "brew install yarn --ignore-dependencies"

# Install Composer for easier PHP dependency management
printf "\n${MAGENTA}Installing Composer for easier PHP dependency management...${NORMAL}\n"
eval "brew install composer"

# Install Oh My Zsh
printf "\n${BLUE}Installing Oh My Zsh...${NORMAL}\n"
eval "sh -c '$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)'"

# Copy ZSH config
# printf "${YELLOW}Copying ZSH config into ~/.zshrc...${NORMAL}\n"
# eval "cp ./zshrc ~/.zshrc"

# Install NVM
printf "\n${GREEN}Installing NVM...${NORMAL}\n"
eval "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash"

# Refresh ZSH config
eval "source ~/.zshrc"
eval "nvm install --lts"

printf "\n${MAGENTA}Installing other brew casks...${NORMAL}\n"
eval "brew install gh"

# Install fonts
eval "sh scripts/fonts.sh"

# Open links for apps that can't be downloaded via brew cask
printf "\n${BLUE}Opening links for apps to download...${NORMAL}\n"

# Browsers
eval "open https://www.google.com/chrome/"
eval "open https://www.mozilla.org/en-US/firefox/new/"


${GREEN} Process Complete

==============================================================================${NORMAL}\n"
