#!/usr/bin/env bash

zsh_plugins=(
  autojump
  zsh-autosuggestions
  zsh-syntax-highlighting
  tree
  ack
  tig
  autojump
  watch
  bat
  tldr
  tmux
  stern
  zsh-completions
  fzf
)

e_header "Installing zsh helper plugins.."
for i in ${zsh_plugins[@]}; do
  brew install $i
done

#install forgit. (This requires fzf installed)
#This changes zshrc
if test ! $(which fzf); then
  e_warning "FZF is not installed. Skipping.."
else
  e_header "FZF is installed. Installing forgit.."
  git clone https://github.com/wfxr/forgit ~/.forgit
  e_header "Adding forgit plugin path in zshrc.."
  echo "source ~/.forgit/forgit.plugin.zsh" >>~/.zshrc
fi

#this step is already done when copy older zshrc
#echo 'plugins=(git zsh-autosuggestions autojump zsh-syntax-highlighting)' >>! ~/.zshrc
