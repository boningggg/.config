# Mac config

## Clone

- If `.config/` is empty
  
  `git clone https://github.com/boningggg/.config.git`

- If `.config/` is not empty
  
  ```bash
  git init
  git remote add origin https://github.com/boningggg/.config.git
  git fetch
  git checkout -t origin/master
  ```

## Install some dependencies

1. Alacritty
  
  ```bash
  brew tap homebrew/cask-fonts && brew install --cask font-go-mono-nerd-font
  brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
  brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font
  ```

2. zsh
  
  ```bash
  brew install pure
  brew install zsh-autosuggestions
  brew install zsh-syntax-highlighting
  cp ~/.config/zsh/.zshrc ~/
  ```
3. NeoVim
  
  ```bash
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

  brew install ripgrep
  brew install fd
  ```

  Then `nvim ~/.config/nvim/lua/plugins.lua` and `:w` (using packer) to install plugins.
