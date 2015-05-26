#!/usr/bin/env bash

# Get the project directory(so run this script from anywhere)

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] \
    && type git > /dev/null 2>&1 \
    && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master


# load the helper function 
source $DOTFILES_DIR/script/helper.sh


# link the bin directory which contains the customized command
createSymlink $DOTFILES_DIR/bin ~/bin

# install all the packages and set the configuration files
source $DOTFILES_DIR/package/install.sh

if [ "$(uname)" == "Darwin" -a -f "$DOTFILES_DIR/install/osx.sh" ]; then
    source "$DOTFILES_DIR/osx/osx.sh"
elif [ "$(uname)" == "Linux" -a -f "$DOTFILES_DIR/install/osx.sh" ]; then
    source "$DOTFILES_DIR/linux/linux.sh"
fi

unset DOTFILES_DIR
info "Installation done!"


