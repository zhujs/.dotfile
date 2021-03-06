TMUX_DIR="$( (cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd) )"


type tmux > /dev/null 2>&1 || installpackage "tmux"

# Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

createSymlink "$TMUX_DIR/tmux.conf" ~/.tmux.conf

unset TMUX_DIR
