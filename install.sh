#!/bin/sh

ask () {
    if [ "${2:-}" = "Y" ]; then
        defaultString="Y/n"
        defaultValue="Y"
    elif [ "${2:-}" = "N" ]; then
        defaultString="y/N"
        defaultValue="N"
    else
        defaultString="y/n"
        defaultValue=
    fi

    while true; do
        read -p "$1 [$defaultString] " answer

        if [ -z $answer ]; then
            answer=$defaultValue
        fi
        case $answer in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
        esac
    done
}

if ask "Install vim?"; then
    echo "  Installing vim:"
    echo "    Removing ~/.vim"
    rm -rf ~/.vim
    echo "    Symlinking ~/.vim"
    ln -s ~/.dharesign-dotfiles/vim ~/.vim
    echo "    Removing ~/.vimrc"
    rm -rf ~/.vimrc
    echo "    Symlinking ~/.vimrc"
    ln -s ~/.dharesign-dotfiles/vimrc ~/.vimrc
    echo "    Installing vim plugins"
    vim +PluginInstall +qall
    echo "  Done installing vim."
fi
