#set up vim
echo "${bold}Setting up .vim & .vimrc${normal}"
cd ~ && git clone https://github.com/BraveLilToaster/.vim.git
ln -s ~/.vim/.vimrc ~/.vimrc
cd ~/.vim/bundle && git submodule init && git submodule update
git submodule foreach git pull origin master

# Install YCM with Javascript Autocomplete

cd ~./vim/bundle/YouCompleteMe && git submodule update --init --recursive
./install.py --tern-completer
cd ~./vim/bundle/tern_for_vim && npm install

