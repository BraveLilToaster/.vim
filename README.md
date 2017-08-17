# .vim

Intialize and symlink

        $ cd ~
        $ ln -s ~/.vim/.vimrc ~/.vimrc

Install Plugins

        $ git submodule init
        $ git submodule update

Update all Plugins

        $ git submodule foreach git pull origin master

To add a new plugin

        $ cd ~/.vim
        $ git submodule add -f git@source/pluginname.git bundle/pluginname

To set up YCM

        $ cd ~./vim/bundle/YouCompleteMe && git submodule update --init --recursive
        $ ./install.py --tern-completer

To set up Tern for Vim
        $ cd ~./vim/bundle/tern_for_vim && npm install
