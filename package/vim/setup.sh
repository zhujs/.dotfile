VIM_DIR="$( (cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd) )"


type vim > /dev/null 2>&1 || installpackage "vim"

createSymlink "$VIM_DIR/.vimrc" ~/.vimrc

unset VIM_DIR
