if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

source $HOME/.dotfiles/colorize-maven.sh

alias ls='ls -hF'
alias ll='ls -l'
alias bar='echo -e "\033[1;33;44m================================================================================\033[0m"'
alias du='du -h'
alias df='df -h'

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export CLICOLOR=1
export PS1='\[\033[0;32m\]\u@\h\[\033[0m\]:\[\033[34m\]\w\[\033[0m\]\$ '
export MAVEN_HOME=/usr
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=$HOME/Development/sdk
export GYP_GENERATORS='ninja'
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export LESS_TERMCAP_mb=$'\E[01;31m'        # begin blinking
export LESS_TERMCAP_me=$'\E[0m'            # end mode
export LESS_TERMCAP_se=$'\E[0m'            # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'     # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'            # end underline
export LESS_TERMCAP_us=$'\E[04;33;146m'    # begin underline is now yellow

export PATH=/usr/local/bin:$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
PATH=$PATH:$HOME/.rvm/bin:$HOME/src/depot_tools # Add RVM to PATH for scripting

case "$TERM" in
    xterm-*color) color_prompt=yes;;
esac

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='mac'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
	platform='freebsd'
fi

if [ "$platform" == "mac" ]; then
	color_prompt=no
fi
    
if [ "$color_prompt" = yes ]; then
    echo -en "\033]P0000000" #black
    echo -en "\033]P1ff6c60" #red
    echo -en "\033]P2a8ff60" #green
    echo -en "\033]P3ffff7a" #yellow
    echo -en "\033]P496cbfe" #blue
    echo -en "\033]P5ff73fe" #magenta
    echo -en "\033]P6a8c5fe" #cyan
    echo -en "\033]P7eeeeee" #white
    echo -en "\033]P87c7c7c" #bright black
    echo -en "\033]P9ff7ab0" #bright red
    echo -en "\033]PAceffac" #bright green
    echo -en "\033]PBffffcc" #bright yellow
    echo -en "\033]PC7adcff" #bright blue
    echo -en "\033]PDff9cfe" #bright magenta
    echo -en "\033]PEdfdffe" #bright cyan
    echo -en "\033]PFffffff" #bright white
fi
unset color_prompt
