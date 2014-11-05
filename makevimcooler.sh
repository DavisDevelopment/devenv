#!/usr/bin/env bash


# Check for existence of Directory and remove if found

RemoveIfPresent () {
	if [ -d "$1" ]; then
		rm -rf "$1"
	fi
}

# Ask whether to install fugitive.vim

InstallFugitive () {

	cd ~/.vim/bundle
	
	RemoveIfPresent ./vim-fugitive

	git clone git://github.com/tpope/vim-fugitive.git
	vim -u NONE -c "helptags vim-fugitive/doc" -c q

}

while true; do
	read -p "Do you wish to install fugitive.vim? (Y / N)" yn
	
	case $yn in
		[Yy]* ) InstallFugitive; break;;
		[Nn]* ) break;;
	* ) echo "Please answer yes or no.";;
	esac
done


InstallAirline () {

	cd ~/.vim/bundle

	RemoveIfPresent ./vim-airline

	git clone https://github.com/bling/vim-airline

}


while true; do
	read -p "Do you wish to install vim-airline? (Y / N)" yn
	
	case $yn in
		[Yy]* ) InstallAirline; break;;
		[Nn]* ) break;;
	* ) echo "Please answer yes or no.";;
	esac
done

InstallNERDTreeTabs () {

	cd ~/.vim/bundle

	RemoveIfPresent ./vim-nerdtree-tabs

	git clone https://github.com/jistr/vim-nerdtree-tabs

}


while true; do
	read -p "Do you wish to install vim-nerdtree-tabs? (Y / N)" yn
	
	case $yn in
		[Yy]* ) InstallNERDTreeTabs; break;;
		[Nn]* ) break;;
	* ) echo "Please answer yes or no.";;
	esac
done

AllDopeShit="SO MUCH DOPE SHIT!!"

Install () {
	cd ~/.vim/bundle
	# delete project if already installed
	RemoveIfPresent "$2"
	git clone "https://github.com/$1/$2"

	export AllDopeShit='$AllDopeShit'.'$2'
}

InstallOtherDopeShit () {
	cd ~/.vim/bundle
	
#	RemoveIfPresent ./vim-session
#	git clone https://github.com/xolox/vim-session

	Install 'scrooloose' 'nerdtree'
	Install 'xolox' 'vim-misc'
	Install 'xolox' 'vim-session'
	Install 'mattn' 'emmet-vim'

	Install 'groenewege' 'vim-less'
	Install 'jdonaldson' 'vaxe'
	
	Install 'hallison' 'vim-markdown'

	Install 'jistr' 'vim-nerdtree-tabs'

	Install 'tpope' 'vim-surround'

}

echo "Installing Dope Shit.."

echo $AllDopeShit

InstallOtherDopeShit
