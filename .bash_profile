# base-files version 3.9-3

# To pick up the latest recommended .bash_profile content,
# look in /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# ~/.bash_profile: executed by bash for login shells.

# source the system wide bashrc if it exists
if [ -e /etc/bash.bashrc ] ; then
  source /etc/bash.bashrc
fi

# source the users bashrc if it exists
if [ -e "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH=${HOME}/bin:${PATH}
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH=${HOME}/man:${MANPATH}
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH=${HOME}/info:${INFOPATH}
# fi

alias ls='ls -FG --color'
alias ll='ls -l'
alias bar='echo -e "\033[1;33;44m================================================================================\033[0m"'

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export CLICOLOR=1
export PS1='\[\033[0;32m\]\u@\h\[\033[0m\]:\[\033[34m\]\w\[\033[0m\]\$ '

case "$TERM" in
    xterm-*color) color_prompt=yes;;
esac
    
if [ "$color_prompt" = yes ]; then
    echo -e "\033]P0000000" #black
    echo -e "\033]P1ff6c60" #red
    echo -e "\033]P2a8ff60" #green
    echo -e "\033]P3ffff7a" #yellow
    echo -e "\033]P496cbfe" #blue
    echo -e "\033]P5ff73fe" #magenta
    echo -e "\033]P6a8c5fe" #cyan
    echo -e "\033]P7eeeeee" #white
    echo -e "\033]P87c7c7c" #bright black
    echo -e "\033]P9ff7ab0" #bright red
    echo -e "\033]PAceffac" #bright green
    echo -e "\033]PBffffcc" #bright yellow
    echo -e "\033]PC7adcff" #bright blue
    echo -e "\033]PDff9cfe" #bright magenta
    echo -e "\033]PEdfdffe" #bright cyan
    echo -e "\033]PFffffff" #bright white
fi
unset color_prompt

