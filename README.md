# Mac config

## Clone

- If `.config/` is empty
  
  `git clone https://github.com/boningggg/.config.git`

- If `.config/` is not empty
  
  ```bash
  git init
  git remote add origin https://github.com/boningggg/.config.git
  git fetch
  git checkout -t origin/main
  ```

## Install some dependencies

### Alacritty
  
  ```bash
  brew tap homebrew/cask-fonts && brew install --cask font-go-mono-nerd-font
  brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
  brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font
  ```

### zsh
  
  ```bash
  brew install pure
  brew install zsh-autosuggestions
  brew install zsh-syntax-highlighting
  cp ~/.config/zsh/.zshrc ~/
  ```
### NeoVim
  
  ```bash
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim

brew install ripgrep
brew install fd
brew install llvm # need lldb-vscode for c language
brew install openjdk@11 # java11
# For the system Java wrappers to find this JDK, symlink it with
sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

  brew install ripgrep
  brew install fd
  brew install llvm # need lldb-vscode for c language
  brew install openjdk@11 # java11
  # For the system Java wrappers to find this JDK, symlink it with
  sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
  ```

  Then `nvim ~/.config/nvim/lua/plugins.lua` and `:w` (using packer) to install plugins.
