PYTHON_DIR="$( (cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd) )"

PIP_PREFIX=""
if [ "$(uname)"x == "Linux"x ]
then
    # Ask for the administrator password upfront.
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has
    # finished. Nice trick to keep the password alive, but it fails due
    # to race condition:
    #   https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh
    while true; do sudo -n true; sleep 60; \
        kill -0 "$$" || exit; done 2>/dev/null &

    PIP_PREFIX="sudo"
fi

${PIP_PREFIX} pip install virtualenv
${PIP_PREFIX} pip install virtualenvwrapper

unset PYTHON_DIR
