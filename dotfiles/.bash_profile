lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

c_cyan=`tput setaf 6`
c_dark=`tput setaf 0`
c_grey=`tput setaf 8`
c_red=`tput setaf 1`
c_lred=`tput setaf 9`
c_green=`tput setaf 2`
c_pink=`tput setaf 5`
c_yellow=`tput setaf 3`
c_sgr0=`tput sgr0`

source ~/.bash/env
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths

show_repository ()
{
  echo -e "$(VCPROMPT_FORMAT=($(tput setaf 3)%s$(tput sgr0):$(tput setaf 5)%h$(tput sgr0)@$(tput setaf 2)%b$(tput setaf 1)%m$(tput setaf 5)%u$(tput sgr0)) vcprompt)"
}

export PS1='\[${c_cyan}\]\u\[${c_lred}\]@\[${c_grey}\]\h\[${c_sgr0}\]:\w\[${c_sgr0}\] $(show_repository)\n\[${c_yellow}\]⚡ \[${c_sgr0}\]'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function tabname {
  printf "\e]1;$1\a"
}

if [ x`type -t cd` == "xfunction" ]; then
  # previously wrapped cd
  eval $(type cd | grep -v 'cd is a function' | sed 's/^cd/original_cd/' | sed 's/^}/;}/' )
else
  # builtin
  eval "original_cd() { builtin cd \$*; }"
fi

cd() {
  original_cd "$*"
  tabname $(basename $(pwd))
}

export CLICOLOR=1
export LSCOLORS=DxFxCxGxBxegedabagaced

[ -f ~/.fzf.bash ] && source ~/.fzf.bash #fzf
