# .vim

Intialize and symlink

        $ cd ~
        $ ln -s ~/.vim/.vimrc ~/.vimrc

Install Plugins

        $ git submodule init
        $ git submodule update

To add a new plugin

        $ cd ~/.vim
        $ git submodule add git@source/pluginname.git bundle/pluginname

To set up command-t

        $ cd ~/.vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make
