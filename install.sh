#!/usr/bin/env bash


usage_error () {
    echo "Usage: bash install.sh [-n] [-r]" && exit 1
}

export INSTALL=true
export REMOVE=false

OPTIND=1

# silent report of error in getopts (the first character of OPTSTRING
# is a colon), same as OPTERR=0

# place the next option in the shell variable $name and
# put option's argument into the variable OPTARG if any
while getopts :nr opt
do
    case ${opt} in
        n) INSTALL=false ;;
        r) REMOVE=true ;;
        
        # In silent mode: unspecified options, also put the option character
        # into OPTARG
        # In non-silent mode (Invalid option and Argument not found):
        #     also unsets OPTARG and prints a diagnostic message
        ?) usage_error ;;

        # In silent mode: options that miss an argument,
        # also put the option character into OPTARG
        :) usage_error ;;
    esac
done


if [ $REMOVE = "false" ]; then
    # Get the project directory (so we can run this script from anywhere)
    DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    # Update dotfiles itself first
    [ -d "$DOTFILES_DIR/.git" ] \
        && type git > /dev/null 2>&1 \
        && echo "Trying to get the latest version of code..." \
        && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

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
else
    rm -f ~/bin
    # uninstall all the configuration files
    # source $DOTFILES_DIR/package/uninstall.sh
fi

unset INSTALL
unset REMOVE
