
# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
# Nice trick to keep the password alive, but it fails due to race condition
#   https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install xclip
type xclip || installpackage xlcip


# ipython
installpackage ipython

