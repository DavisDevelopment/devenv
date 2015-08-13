#!/usr/bin/env bash

RemoveIfPresent() {
	if [ -d "$1" ]; then
		rm -rf "$1";
	fi
}

# Generic 'install vim-package' function
Install () {
	cd ~/.vim/bundle
	# delete project if already installed
	RemoveIfPresent "$2"
	git clone "https://github.com/$1/$2"
}

install_packages() {
	cd ~/.vim/bundle

	Install 'scrooloose' 'nerdtree'
	echo 'Installing NERDTree'
	
	Install 'jistr' 'vim-nerdtree-tabs'
	echo 'Installing NERDTreeTabs'
	
	# Install 'xolox' 'vim-misc'
	Install 'xolox' 'vim-session'
	echo 'Installing vim-session'
	
	
	Install 'mattn' 'emmet-vim'
	echo 'Installing Emmet for vim'

	Install 'groenewege' 'vim-less'
	echo 'Installing LESS Syntax-Highlighting'
	
	#Install 'jdonaldson' 'vaxe'
	
	Install 'hallison' 'vim-markdown'
	echo 'Installing vim-markdown'

	Install 'tpope' 'vim-surround'
	echo 'Installing vim-surround'
}