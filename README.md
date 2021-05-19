## mac-setup

---
Set up your development environment on macOs very easily with just one command.

Please go through REAMDE.md completely before starting.

### `Setps to follow :`

##### `1. Clone the repo`

``` bash
git clone https://github.com/tushartambe/mac-setup ~/mac-setup && cd mac-setup
```

##### `2. Run Script`

``` bash
sh install.sh
```

##### `3. Setup iTerm2`

Import the `Default-Iterm2-Profile.json` file to your iTerm.

``` 

Open iTerm2 > Open Preferences > Profiles > Other actions > Import JSON Profiles.. > Select this folder's `Default-Iterm2-Profile.json` file.
```

---

### `Solve Errors and interruptions :`

* If script exited after you make zsh as default shell after installation of `oh-my-zsh`. Don't worry! Just `rerun the script` and don't set github mail and username. `oh-my-zsh` installation will be skipped.

* If you get following error

 `[oh-my-zsh] Insecure completion-dependent directories detected:`

    Just set `ZSH_DISABLE_COMPFIX=true` in `~/.zshrc` before you source .oh-my-zsh in your zshrc file, and open new terminal or run `source ~/.zshrc` . 

* If auto-suggestions are shown in same color as your command then change and update it in colors tab of iterm2.

 `iTerm2 → Profiles → Open Profiles... → Select Custom → Edit Profiles...→ In the Colors tab → Check Black Bright `

    after changing this start new terminal.

    **OR**

    Just do `3. Setup iTerm2` this step to apply my iTerm settings at the end.

---

### Tools you'll get : 

* [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Homebrew](http://brew.sh/)

##### `1. Command line tools`

* [autojump](https://github.com/wting/autojump)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)
* [tree](http://mama.indstate.edu/users/ice/tree/)
* [ack](https://beyondgrep.com/)
* [tig](https://jonas.github.io/tig/)
* [watch](https://gitlab.com/procps-ng/procps)
* [bat](https://github.com/sharkdp/bat)
* [tldr](https://tldr.sh/)
* [tmux](https://tmux.github.io/)
* [stern](https://github.com/stern/stern)
* [fzf](https://github.com/junegunn/fzf)
* [forgit](https://github.com/wfxr/forgit)

##### `2. macOs applications`

* [visual-studio-code](https://code.visualstudio.com/)
* [intellij-idea](https://www.jetbrains.com/idea/)
* [iterm2](https://iterm2.com/)
* [firefox](https://www.mozilla.org/en-US/firefox/)
* [brave-browser](https://brave.com/)
* [postman](https://www.postman.com/)
* [flycut](https://github.com/TermiT/Flycut)
* [notion](https://www.notion.so/)
* [evernote](https://evernote.com/)
* [zoom](https://www.zoom.us/)
* [docker](https://www.docker.com/products/docker-desktop)

##### `3. Vim Plugins`

* [auto-pairs](https://github.com/jiangmiao/auto-pairs.git)
* [AutoComplPop](https://github.com/vim-scripts/AutoComplPop.git)
* [nerdtree](https://github.com/scrooloose/nerdtree.git)
* [indentline](https://github.com/yggdroot/indentline.git)
* [lightline.vim](https://github.com/itchyny/lightline.vim.git)
* [vim-colorschemes](https://github.com/flazz/vim-colorschemes.git)
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter.git)
* [vim-javascript](https://github.com/pangloss/vim-javascript.git)
* [multiple-cursors](https://github.com/terryma/vim-multiple-cursors.git)
* [vim-prettier](https://github.com/prettier/vim-prettier.git)

### Check following link for VSCode settings

https://gist.github.com/tushartambe/33de9b12b475a1b29713cfde2d5ab71c
