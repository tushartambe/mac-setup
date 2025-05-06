#!/usr/bin/env bash

set -e

### Helper functions ###

echo_header() {
  echo "\n👉 \033[1;34m$1\033[0m"
}

echo_success() {
  echo "✅ \033[1;32m$1\033[0m"
}

echo_warning() {
  echo "⚠️  \033[1;33m$1\033[0m"
}

check_command() {
  command -v "$1" >/dev/null 2>&1
}

### 1️⃣ Check for Git ###

echo_header "Checking if Git is installed..."
if check_command git; then
  echo_success "Git is already installed."
else
  echo_warning "Git is not installed! Please install Git manually using these steps:"
  echo "\n1. Download Xcode Command Line Tools:"
  echo "   xcode-select --install"
  echo "\n2. Or install from: https://git-scm.com/download/mac"
  echo "\nAfter installation, re-run this script."
  exit 1
fi

### 2️⃣ Install Oh My Zsh ###

echo_header "Installing Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo_success "Oh My Zsh already installed."
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo_success "Oh My Zsh installed."
fi

### 3️⃣ Install Homebrew ###

echo_header "Installing Homebrew..."
if check_command brew; then
  echo_success "Homebrew already installed."
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo_success "Homebrew installed."

  echo >> $HOME/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo_success "Homebrew path set."
fi

### 4️⃣ Install Languages ###

LANG_PACKAGES=(node go)
for pkg in "${LANG_PACKAGES[@]}"; do
  echo_header "Installing $pkg..."
  if brew list "$pkg" >/dev/null 2>&1; then
    echo_success "$pkg is already installed."
  else
    brew install "$pkg"
    echo_success "$pkg installed."
  fi
done

### 5️⃣ Install macOS Applications ###

CASK_APPS=(warp brave-browser cursor flycut notion docker postman intellij-idea)
for app in "${CASK_APPS[@]}"; do
  echo_header "Installing $app..."
  if brew list --cask "$app" >/dev/null 2>&1; then
    echo_success "$app is already installed."
  else
    brew install --cask "$app"
    echo_success "$app installed."
  fi
done

### 6️⃣ Install Fonts ###

echo_header "Installing fonts..."
brew install --cask font-fira-code font-jetbrains-mono

### 7️⃣ Install Terminal Tools ###

TOOLS=(autojump zsh-autosuggestions zsh-syntax-highlighting zsh-completions tree ack tig watch bat tldr tmux stern fzf)
for tool in "${TOOLS[@]}"; do
  echo_header "Installing $tool..."
  if brew list "$tool" >/dev/null 2>&1; then
    echo_success "$tool is already installed."
  else
    brew install "$tool"
    echo_success "$tool installed."
  fi
done

### Special: Forgit ###
echo_header "Installing forgit..."
if [ -d "$HOME/.forgit" ]; then
  echo_success "forgit already installed."
else
  git clone https://github.com/wfxr/forgit "$HOME/.forgit"
  echo "source $HOME/.forgit/forgit.plugin.zsh" >> "$HOME/.zshrc"
  echo_success "forgit installed and sourced in ~/.zshrc."
fi

# echo_warning "⚠️  Make sure to add the following to your ~/.zshrc if not already present to active some zsh plugins:"
# echo "  source \\$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# echo "  source \\$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# echo "  [ -f \\$(brew --prefix)/etc/profile.d/autojump.sh ] && . \\$(brew --prefix)/etc/profile.d/autojump.sh"

# echo_success "Don't forget to restart your terminal or run 'source ~/.zshrc'!"

echo_warning "⚠️  Some zsh plugins need to be activated in your ~/.zshrc:"

echo "  source \$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
echo "  source \$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
echo "  [ -f \$(brew --prefix)/etc/profile.d/autojump.sh ] && . \$(brew --prefix)/etc/profile.d/autojump.sh"

read -p "👉 Do you want me to add these lines automatically to your ~/.zshrc? (y/n): " confirm
if [[ $confirm =~ ^[Yy]$ ]]; then
  {
    echo ""
    echo "# Added by setup script"
    echo "source \$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    echo "source \$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    echo "[ -f \$(brew --prefix)/etc/profile.d/autojump.sh ] && . \$(brew --prefix)/etc/profile.d/autojump.sh"
  } >> ~/.zshrc
  echo_success "✅ Lines added to ~/.zshrc!"
else
  echo_warning "⚠️  Skipped adding lines to ~/.zshrc. You can do it manually later."
fi

### 8️⃣ Install Vim Plugins ###

echo_header "Installing Vim plugins..."
VIM_PLUGINS=(
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

VIM_PLUGIN_PATH="$HOME/.vim/pack/myplugins/start"
mkdir -p "$VIM_PLUGIN_PATH"

for plugin in "${VIM_PLUGINS[@]}"; do
  PLUGIN_NAME=$(basename "$plugin" .git)
  TARGET_DIR="$VIM_PLUGIN_PATH/$PLUGIN_NAME"
  if [ -d "$TARGET_DIR" ]; then
    echo_success "Vim plugin $PLUGIN_NAME already installed."
  else
    git clone "$plugin" "$TARGET_DIR"
    echo_success "Installed Vim plugin $PLUGIN_NAME."
  fi
done

echo_success "🎉 All setup tasks completed! Reload the ZSH to enjoy your Mac development environment. 🚀"
echo_success "Don't forget to restart your terminal or run 'source ~/.zshrc'!"
echo_success "Done!🎉"
