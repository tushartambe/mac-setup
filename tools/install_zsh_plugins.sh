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
  e_header "Installing : $i"
  brew install $i
done
e_success "Installed zsh plugins sucessfully.."

# Activating plugins by sourcing in zshrc
e_header "Activating plugins by sourcing them in ~/.zshrc.."
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >>~/.zshrc
echo "[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh" >>~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>~/.zshrc
echo "export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$(brew --prefix)/share/zsh-syntax-highlighting/highlighters" >>~/.zshenv
e_success "Activated plugins.. [ autojump, zsh-autosuggestions, zsh-syntax-highlighting]."


#install forgit. (This requires fzf installed)
#This changes zshrc
if test ! $(which fzf); then
  e_warning "FZF is not installed. Skipping forgit installation.."
else
  e_header "FZF is installed. Installing forgit.."
  git clone https://github.com/wfxr/forgit ~/.forgit
  e_header "Adding forgit plugin path in zshrc.."
  echo "source ~/.forgit/forgit.plugin.zsh" >>~/.zshrc
  e_success "Successfully installed 'forgit'."
fi

#this step is already done when copy older zshrc
#echo 'plugins=(git zsh-autosuggestions autojump zsh-syntax-highlighting)' >>! ~/.zshrc
