
SSH_DIR="$( (cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd) )"


type ssh > /dev/null 2>&1 || installpackage "ssh"

mkdir -p ~/.ssh/
createSymlink "$SSH_DIR/config" ~/.ssh/config

unset SSH_DIR
