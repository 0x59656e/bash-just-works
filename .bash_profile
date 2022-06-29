# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:~/bin:~/.local/bin:/usr/local/bin
export PROXY=""
export PROXY_PORT=""
export VISUAL=vim
export EDITOR="$VISUAL"
