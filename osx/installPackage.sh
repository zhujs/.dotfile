# tool to access the OSX's clipboard in tmux
#     http://www.economyofeffort.com/2013/07/29/reattach-to-user-namespace-the-fix-for-your-tmux-in-os-x-woes/
type reattach-to-user-namespace &> /dev/null || installpackage reattach-to-user-namespace

# bash completion
installpackage bash-completion

# install brew-cask
installpackage caskroom/cask/brew-cask

# Java
brew tap caskroom/versions
brew cask install java7

# intellij-idea Community Edition
brew cask install intellij-idea-ce
