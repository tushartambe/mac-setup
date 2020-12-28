#!/usr/bin/env bash

vim_plugins=(
  https://github.com/jiangmiao/auto-pairs.git
  https://github.com/vim-scripts/AutoComplPop.git
  https://github.com/scrooloose/nerdtree.git
  https://github.com/yggdroot/indentline.git
  https://github.com/itchyny/lightline.vim.git
  https://github.com/flazz/vim-colorschemes.git
  https://github.com/airblade/vim-gitgutter.git
  https://github.com/pangloss/vim-javascript.git
  https://github.com/terryma/vim-multiple-cursors.git
  https://github.com/prettier/vim-prettier.git
)

VIM_PLUGINS_PATH=~/.vim/pack/myplugins/start
mkdir -p $VIM_PLUGINS_PATH

e_header "Installing vim plugins.."
for i in ${vim_plugins[@]}; do
  SUBSTR=$(echo $i | cut -d'/' -f5 | cut -d'.' -f1)
  git clone $i "$VIM_PLUGINS_PATH/$SUBSTR"
done
