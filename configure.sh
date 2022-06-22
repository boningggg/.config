function macos_config {
	brew install ripgrep
	brew install fd
	brew install clang-format
	brew install stylua
	brew install llvm # need lldb-vscode for c language
	brew install openjdk
	# For the system Java wrappers to find this JDK, symlink it with
	sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
}

function linux_config {
	sudo apt install ripgrep
	sudo apt install fd-find
	sudo apt install llvm-14-tools
	suao apt install openjdk-18-jdk
}

# 1. Install Neovim package management packer.nvim
echo "1. Git clone Neovim package management - packer.nvim."
PACKER_DIR="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ -d "${PACKER_DIR}" ]; then
	echo "   packer.nvim has been cloned."
else
	echo "Cloning packer.nvim..."
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# 2. Install dependences for Neovim
echo "2. Install dependences for Neovim."
echo "   Install ripgrep, fd, llvm, openjdk"
case "${OSTYPE}" in
	darwin*) macos_config ;;
	linux*)  linux_config ;;
esac
