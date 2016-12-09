
# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
# Nice trick to keep the password alive, but it fails due to race condition
#   https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install xclip
type xclip &> /dev/null || installpackage xlcip

type cmake &> /dev/null || installpackage cmake

type shellcheck &> /dev/null || installpackage shellcheck
type tree &> /dev/null || installpackage tree

type ctags &> /dev/null || installpackage exuberant-ctags

type clang &> /dev/null || installpackage clang

type dos2unix &> /dev/null || installpackage dos2unix
