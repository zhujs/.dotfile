BASH_DIR="$( (cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd) )"

# update bash version in OSX
if [ "$(uname)x" == "Darwin" ]
then
    installpackage bash
fi

createSymlink "$BASH_DIR/bashrc" ~/.bashrc
createSymlink "$BASH_DIR/bash_config" ~/.bash_config
createSymlink "$BASH_DIR/bash_prompt" ~/.bash_prompt
createSymlink "$BASH_DIR/profile" ~/.profile

createSymlink "$BASH_DIR/inputrc" ~/.inputrc

unset BASH_DIR
