# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:~/bin:~/Applications
export PROXY=""
export PROXY_PORT=""
export VISUAL=vim
export EDITOR="$VISUAL"
