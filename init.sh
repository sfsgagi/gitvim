#

# install git first
# Installation:
# git clone git@github.com:sfsgagi/gitvim.git ~/.vim

# Create symlinks:
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# Switch to the `~/.vim` directory, and fetch submodules:

cd ~/.vim
git submodule init
git submodule update

cd ~
ln -s ~/.vim/gagienv/.bash_aliases ~/.bash_aliases
ln -s ~/.vim/gagienv/.bash_helper ~/.bash_helper
ln -s ~/.vim/gagienv/.irbrc ~/.irbrc

cat <<EOF >> ~/.bashrc
# additional helper functions
if [ -f ~/.bash_helper ]; then
    . ~/.bash_helper
fi
EOF

source ~/.bashrc
