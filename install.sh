#!/usr/bin/env bash

# Get the project directory (so we can run this script from anywhere)

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] \
    && type git > /dev/null 2>&1 \
    && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

usage_error () {
    echo "Usage: source [-n] [-r] install.sh" && exit 1
}

export INSTALL=true
export REMOVE=false

OPTIND=1
# silent report of error in getopts (the first character of OPTSTRING is a colon), same as OPTERR=0
# put option's argument into the variable OPTARG if any
while getopts :nr opt
do
    case ${opt} in
        n) INSTALL=false ;;
        r) REMOVE=true ;;
        ?) usage_error ;; # unspecified options or options that miss an argument (both in silent and non-silent mode)
        :) usage_error ;; # options that miss an argument (silent mode)
    esac
done

# load the helper function 
source $DOTFILES_DIR/script/helper.sh

# link the bin directory which contains the customized command
createSymlink $DOTFILES_DIR/bin ~/bin
chmod u+x ~/bin/*

# install all the packages and set the configuration files
source $DOTFILES_DIR/package/install.sh

if [ "$(uname)" == "Darwin" -a -f "$DOTFILES_DIR/osx/osx.sh" ]; then
    source "$DOTFILES_DIR/osx/osx.sh"
elif [ "$(uname)" == "Linux" -a -f "$DOTFILES_DIR/linux/linux.sh" ]; then
    source "$DOTFILES_DIR/linux/linux.sh"
fi

unset DOTFILES_DIR
info "Installation done!"


