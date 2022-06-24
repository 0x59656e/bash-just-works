export PROXY_SERVER=''
export PROXY_PORT=''
export PATH="$HOME/bin:/sbin:$PATH"

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Match all files and zero or more directories and subdirectories.
shopt -s globstar

# Enable extended globs
shopt -s extglob

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set a fancy prompt
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;

esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Create directory and go into it
function mdcd() {
    mkdir -pv $1
    cd $1
}

# Extract any archive
# TODO: test it with different file types
# Source: https://wiki.archlinux.org/title/Bash/Functions#Extract
function extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
        *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
            c=(tar xvf)
            ;;
        *.7z) c=(7z x) ;;
        *.Z) c=(uncompress) ;;
        *.bz2) c=(bunzip2) ;;
        *.exe) c=(cabextract) ;;
        *.gz) c=(gunzip) ;;
        *.rar) c=(unrar x) ;;
        *.xz) c=(unxz) ;;
        *.zip) c=(unzip) ;;
        *.zst) c=(unzstd) ;;
        *)
            echo "$0: unrecognized file extension: \`$i'" >&2
            continue
            ;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}
