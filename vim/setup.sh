
. ~/.devenv/vim/packages.sh

# Install commands used to install the vim-setup
install_commands () {
    sudo apt-get install wget curl vim
}

# Function to install vim's pathogen package-manager
install_pathogen() {
    echo 'Installing Pathogen'
    sudo mkdir -p '~/.vim/autoload' '~/.vim/bundle'
    sudo curl -LSso '~/.vim/autoload/pathogen.vim' 'https://tpo.pe/pathogen.vim'
}

# Install the 'monokai' color-scheme
install_monokai() {
    echo 'Installing Monokai color-scheme'
    # Create the 'colors' directory, if needed
    if ! [ -d ~/.vim/colors ]; then
        sudo mkdir ~/.vim/colors/
    fi
    cd ~/.vim/colors/
    wget 'https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim';
}

echo 'Purging any/all pre-existing vim-setup'
RemoveIfPresent ~/.vim/autoload/
RemoveIfPresent ~/.vim/bundle/

echo 'Constructing new vim-setup'
install_commands
install_pathogen
install_monokai
install_packages

sudo cp ~/.devenv/vim/vimrc ~/.vimrc