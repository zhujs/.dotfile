VIM_DIR="$( (cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd) )"


type vim > /dev/null 2>&1 || installpackage "vim"

type git &> /dev/null || installpackage "git"

# get the Vundle plungin
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
createSymlink "$VIM_DIR/vimrc" ~/.vimrc
createSymlink "$VIM_DIR/vim_config" ~/.vim_config

vim +PluginInstall +PluginUpdate +qall
unset VIM_DIR
