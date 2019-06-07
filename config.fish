function fish_prompt
  echo -en (set_color brgreen)"\n$USER"@(prompt_hostname) (set_color bryellow)(prompt_pwd) (set_color brmagenta)(__fish_git_prompt '%s')
  echo -en (set_color normal)"\n\$ "
end

function bde_test
  set i 0
  while true
    if eval $argv[1] $i
      set i (math $i + 1)
    else
      break
    end
  end
end

function op1
  ssh -t dharesig@prqsgateway inline getprdwin@op1@$argv[1]@getprdwin
end

function dev
  ssh -t dharesig@devgateway inline $argv[1]
end

set -g fish_prompt_pwd_dir_length 0

set -g fish_greeting

set -x LSCOLORS gxfxcxdxbxegedabagacad

alias vim="vim -p"

set PATH $HOME/.cargo/bin $PATH
