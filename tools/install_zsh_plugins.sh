#!/usr/bin/env bash

zsh_plugins=(
  autojump
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  tree
  ack
  tig
  watch
  bat
  tldr
  tmux
  stern
  fzf
)

e_header "Installing zsh helper plugins.."
for i in ${zsh_plugins[@]}; do
  brew install $i
done

# Activating plugins by sourcing in zshrc
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc
echo "[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh" >>~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>~/.zshrc
echo "export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$(brew --prefix)/share/zsh-syntax-highlighting/highlighters" >>~/.zshenv

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
