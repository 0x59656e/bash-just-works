# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PROXY='IP'
export PROXY_PORT='PORT'

# Set and Unset Proxy
function proxy_on(){
    export ALL_PROXY=socks5://$PROXY:$PROXY_PORT
    echo -e "Proxy Set: ${ALL_PROXY}"
}

function proxy_off(){
    unset ALL_PROXY
    echo -e "Proxy Off"
}

