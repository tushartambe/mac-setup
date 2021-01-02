#!/bin/bash

#Don not auto update homebrew for every brew installation
export HOMEBREW_NO_AUTO_UPDATE=1

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do
  sudo -nv true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

source helpers.sh

#Setting mac defaults
source mac_defaults.sh

# 1. Git configuration

ask "${blue} (Press enter to skip) Enter Your Github Email: "
read -r mailId
if is_empty $mailId; then
  git config --global user.email "$mailId" # Git Email Id
  e_success "Git Email is set to $mailId"
else
  e_error "Not set"
fi

ask "${blue} (Press enter to skip) Enter Your Github Username: "
read -r userName
if is_empty $userName; then
  git config --global user.name "$userName" # Git Username
  e_success "Git Username is set to $userName"
else
  e_error "Not set"
fi

# 2. Install Oh-My-Zsh & custom aliases

ZSH=~/.oh-my-zsh

if [ -d "$ZSH" ]; then
  e_warning "Oh My Zsh is already installed. Skipping.."
else
  e_header "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  e_header "Copying older zshrc"
  cp dotFiles/zshrc ~/.zshrc
fi

# 3. Install Homebrew

if test ! $(which brew); then
  e_header "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  #alternative way
  #/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  e_warning "Homebrew is already installed. Skipping.."
fi

# 4. Install ZSH helper plugins
source tools/install_zsh_plugins.sh

# 5. Install Vim Plugins and copy vimrc
e_header "Copying vimrc on your local.."
cp dotFiles/vimrc ~/.vimrc
source tools/install_vim_plugins.sh

# 6. Install Node

if test ! $(which node); then
  e_header "Installing node.."

  brew install node

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash #nvm
  e_header "Adding nvm path in zshrc.."
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

else
  e_warning "Node is already installed. Skipping.."
fi

# 7. Install npm tools
source tools/install_npm_packages.sh

# 8. Install brew taps and casks
source tools/install_brew_taps_and_casks.sh

# 9. Install p10k theme
e_header "Installing p10k Theme. This will change zshrc"
brew install romkatv/powerlevel10k/powerlevel10k
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

#Source zshrc
source ~/.zshrc

e_thanks "Cool Your setup is done.. Enjoy🎉🎉"
