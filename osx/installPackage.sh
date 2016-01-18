# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
# Nice trick to keep the password alive, but it fails due to race condition
#   https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# tool to access the OSX's clipboard in tmux
#     http://www.economyofeffort.com/2013/07/29/reattach-to-user-namespace-the-fix-for-your-tmux-in-os-x-woes/
type reattach-to-user-namespace &> /dev/null || brew install reattach-to-user-namespace

# update bash and install bash-completion
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# install brew-cask
brew install caskroom/cask/brew-cask

# update to new version
brew install gdb  # gdb requires further actions to make it work. See `brew info gdb`.
brew install gpatch
brew install m4
brew install make

# install more GNU-tools
brew install coreutils 
#PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
brew tap homebrew/dupes
brew install binutils
brew install diffutils
brew install ed --default-names
brew install findutils --with-default-names
brew install gawk
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gnutls
brew install grep --with-default-names
brew install gzip
brew install screen
brew install watch
brew install wdiff --with-gettext
brew install wget --with-iri

# not GNU, update to new version
brew install file-formula
brew install git
brew install less
brew install openssh
brew install python
brew install rsync
brew install unzip
brew install vim --override-system-vi
brew install macvim --override-system-vim --custom-system-icons

# Java
brew tap caskroom/versions
brew cask install java7

# intellij-idea Community Edition
brew cask install intellij-idea-ce

brew cleanup
