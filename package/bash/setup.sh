BASH_DIR="$( (cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd) )"

createSymlink "$BASH_DIR/.bashrc" ~/.bashrc
createSymlink "$BASH_DIR/.bash_config" ~/.bash_config

createSymlink "$BASH_DIR/.inputrc" ~/.inputrc

unset BASH_DIR
