#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

BASH_RC=".bashrc"
BASH_PROFILE=".bash_profile"
BASH_ALIASES=".bash_aliases"
COPY_BACKEND="/usr/bin/cp"

#err() {
#  echo -e "${RED}ERROR${NO_COLOR} : $(date +'%Y-%m-%dT%H:%M:%S%z')]: $1" >&2
#}
#
#warn() {
#  echo -e "${YELLOW}WARNING${NO_COLOR} - [$(date +'%Y-%m-%dT%H:%M:%S%z')]: $1"
#}

info() {
  echo -e "${GREEN}INFO${NO_COLOR} - [$(date +'%Y-%m-%dT%H:%M:%S%z')]: $1"
}

copy_and_overwrite() {
  cp_command="${COPY_BACKEND} -f $(pwd)/$1 $HOME"
  info "$cp_command"
  $cp_command
}

backup() {
  info "Backing up .bash_ files ..."
  tar -czvf $HOME/bash_dotfiles_bak.tar.gz $HOME/.bash*
}

source_file() {
  info "source $HOME/$BASH_PROFILE"
  info "source $HOME/$BASH_RC"
}

main() {
  backup
  copy_and_overwrite $BASH_PROFILE
  copy_and_overwrite $BASH_RC
  copy_and_overwrite $BASH_ALIASES
  source_file
}

main
