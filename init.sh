#

# install git first
# Installation:
# git clone git@github.com:sfsgagi/gitvim.git ~/.vim

# Create symlinks:
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# Switch to the `~/.vim` directory, and fetch submodules:

# nodejs and jshint installation
sudo apt-get install python-software-properties
sudo apt-add-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
sudo npm install -g jshint

# for command-t
# vim --version | grep ruby
# will show e.g. -lruby1.8
# rvm use 1.8 (install if necessary)
# ruby -v should now be the same as in v
#cd ~/.vim/bundle/command-t/ruby/command-t
#ruby extconf.rb
#make

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
