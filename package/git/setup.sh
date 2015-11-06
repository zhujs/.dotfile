GIT_DIR="$( (cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd) )"


type git > /dev/null 2>&1 || installpackage "git"

createSymlink "$GIT_DIR/gitconfig" ~/.gitconfig

unset GIT_DIR
