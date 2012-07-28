lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

OS=`lowercase \`uname\``

if [ "$OS" == "darwin" ]; then
    alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
    alias vi=/Applications/MacVim.app/Contents/MacOS/Vim
fi

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

export PS1='\[${c_cyan}\]\u\[${c_lred}\]@\[${c_grey}\]\h\[${c_sgr0}\]:\w\[${c_sgr0}\] $(show_repository)\n${c_yellow}⚡ ${c_sgr0}'

PATH=$PATH:~/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
