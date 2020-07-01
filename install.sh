#! /bin/bash

function make_symbolic_links() {
    local ABSOLUTE_PATH=`pwd`

    ln -s $ABSOLUTE_PATH/config.vim ~/.vim/config/config.vim
    ln -s $ABSOLUTE_PATH/plugins.vim ~/.vim/config/plugins.vim
    ln -s $ABSOLUTE_PATH/pluginsConfig.vim ~/.vim/config/pluginsConfig.vim
    ln -s $ABSOLUTE_PATH/.vimrc ~/.vimrc
}

function make_dir(){
    mkdir -p ~/.vim/config/
}

function main(){
    make_dir
    make_symbolic_links
}

main
