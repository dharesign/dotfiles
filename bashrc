[ -r ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -r ~/.git-prompt.sh ] && source ~/.git-prompt.sh

C_GREEN=$'\e[38;5;10m'
C_YELLOW=$'\e[38;5;11m'
C_PINK=$'\e[38;5;162m'
C_RESET=$'\e[0m'

if hash __git_ps1 2>/dev/null; then
    PS1="\n$C_GREEN\u@\h $C_YELLOW\w $C_PINK\$(__git_ps1 '%s')$C_RESET\n\$ "
else
    PS1="\n$C_GREEN\u@\h $C_YELLOW\w$C_RESET\n\$ "
fi
export PS1

export HISTCONTROL=ignoredups
export LSCOLORS=gxfxcxdxbxegedabagacad

[ -r ~/.bash_aliases ] && source ~/.bash_aliases
[ -r ~/.local_aliases ] && source ~/.local_aliases
