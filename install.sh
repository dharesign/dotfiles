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

if ask "Install bash?"; then
    echo "  Installing bash:"
    echo "    Removing ~/.bashrc"
    rm -rf ~/.bashrc
    echo "    Symlinking ~/.bashrc"
    ln -s ~/.dharesign-dotfiles/bashrc ~/.bashrc
    echo "    Removing ~/.bash_aliases"
    rm -rf ~/.bash_aliases
    echo "    Symlinking ~/.bash_aliases"
    ln -s ~/.dharesign-dotfiles/bash_aliases ~/.bash_aliases
    echo "    Removing ~/.bash_profile"
    rm -rf ~/.bash_profile
    echo "    Symlinking ~/.bash_profile"
    ln -s ~/.dharesign-dotfiles/bash_profile ~/.bash_profile
    echo "  Done installing bash"
fi

if ask "Install git?"; then
    echo "  Installing git:"
    echo "    Removing ~/.gitconfig"
    rm -rf ~/.gitconfig
    echo "    Symlinking ~/.gitconfig"
    ln -s ~/.dharesign-dotfiles/gitconfig ~/.gitconfig
    echo "    Removing ~/.git-completion.bash"
    rm -rf ~/.git-completion.bash
    echo "    Symlinking ~/.git-completion.bash"
    ln -s ~/.dharesign-dotfiles/git/contrib/completion/git-completion.bash ~/.git-completion.bash
    echo "    Removing ~/.git-prompt.sh"
    rm -rf ~/.git-prompt.sh
    echo "    Symlinking ~/.git-prompt.sh"
    ln -s ~/.dharesign-dotfiles/git/contrib/completion/git-prompt.sh ~/.git-prompt.sh
    echo "  Done installing git"
fi

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
