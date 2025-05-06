# 🛠️ Mac Setup Script

This interactive script sets up a developer-friendly macOS environment with essential tools, languages, apps, fonts, and plugins.

## Features

* Checks if Git is installed; provides steps if missing
* Installs **Oh My Zsh** and **Homebrew**
* Installs languages: Node.js, Go
* Installs macOS apps: Warp, Brave, Cursor, Flycut, Notion, Docker, Postman, IntelliJ IDEA
* Installs fonts: Fira Code, JetBrains Mono
* Installs CLI tools: autojump, zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions, tree, ack, tig, watch, bat, tldr, tmux, stern, fzf, forgit
* Installs Vim plugins (as defined in script)
* Highlights manual steps (like adding env variables)
* Uses emojis and clean logs
* Skips already installed tools (idempotent)

## Usage

```bash
sh mac-setup.sh
```

## Notes

* The script will ask for confirmation to modify `~/.zshrc` for plugin activation.
* After setup, restart your terminal or run:

```bash
source ~/.zshrc
```
* Rerun the script again if script is exited after `oh-my-zsh` and `brew` installation. Run again and again till you get `Done!🎉` this log.

 
## Manual Steps

If needed, add the following to `~/.zshrc`:

```bash
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh
```

Enjoy your new setup! 🚀
