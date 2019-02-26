# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
force_color_prompt=
PS1="\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;239m\]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;201m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;239m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# turn off bell
set bell-style none 

# cd and ls
function go () {
    clear
    cd $1
    ls
    echo ""
}

# include cheat function
if [ -f $HOME/Scripts/cheat.sh ]; then
    source $HOME/Scripts/cheat.sh
fi

echo -e "\e]12;magenta\a"

export PATH=$HOME/.local/bin:$PATH

# I always forget to type nvim then can't figure out what's wrong
alias vim="nvim"
alias ovim="vim" #ovim for old vim
