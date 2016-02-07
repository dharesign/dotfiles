[ -r ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -r ~/.git-prompt.sh ] && source ~/.git-prompt.sh

GREEN='\e[0;32m'
YELLOW='\e[0;33m'
PINK='\e[0;35m'
COLOR_RESET='\e[m'

if hash __git_ps1 2>/dev/null; then
    PS1="\n$GREEN\u@\h $YELLOW\w $PINK\$(__git_ps1 '%s')\n$COLOR_RESET\$ "
else
    PS1="\n$GREEN\u@\h $YELLOW\w\n$COLOR_RESET\$ "
fi
export PS1

export HISTCONTROL=ignoredups

[ -r ~/.bash_aliases ] && source ~/.bash_aliases
