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
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_pink=`tput setaf 5`
c_sgr0=`tput sgr0`

source ~/.bash/env
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths

show_repository ()
{
  echo -e "$(VCPROMPT_FORMAT=($(tput setaf 3)%s$(tput sgr0):$(tput setaf 7)%h$(tput sgr0)@$(tput setaf 2)%b$(tput setaf 1)%m$(tput setaf 5)%u$(tput sgr0)) vcprompt)"
}

export PS1='\[${c_cyan}\]\u\[${c_sgr0}\]@\[${c_dark}\]\h\[${c_sgr0}\]:\w\[${c_sgr0}\] $(show_repository)\n\$ '
