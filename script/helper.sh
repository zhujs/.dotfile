# output information


function info() {
    # "$@" is equivalent to "$1" "$2" ...
    echo -e "$(tput setaf 4)[INFO]$(tput sgr0)" "$@"
}

# used to install the packages
function installpackage() {
    if [ "$INSTALL" == "false" ]; then
        return
    fi
    local installCommand=""
    
    if type "$1" > /dev/null 2>&1; then
        info "$1 already exists."
        return
    fi

    # determine how to install the package
    if [ $(uname)x == "Linux"x ]; then
        type apt-get > /dev/null 2>&1 && installCommand="sudo apt-get -y install"
        # type yum > /dev/null 2>&1 && installCommand="sudo yum -y install" 
    elif [ $(uname)x == "Darwin"x ]; then
        # install the package manager tool for OS X if necessary
        if ! type brew &> /dev/null
        then
            info "Trying to install Homebrew first..."
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            info "Installation of brew Completed."
        fi
        installCommand="brew install"
    fi 

    if [ -z installCommand ]; then
        info "Cannot find the command-line package tool."
    else
        info "Try to install $1 ..."
        eval "$installCommand $1"
        info "Installation Done."
    fi
}

# used to backup the existing files if neccesary
function backup() {
    # use the `ls` command to test if filename exists instead of `test`
    # because `ls -d` does not dereference symbolic link
    if ls -d "$1" &> /dev/null ; then
        # back up the directory
        dirName=~/.dotfileBackup #/$(date "+%Y%m%d-%H:%M:%S")
        [ -d "$dirName" ] || mkdir -p $dirName
        backupName=$dirName/$(basename $1)$(date "+%Y%m%d-%H:%M:%S")
        mv "$1" "$backupName" > /dev/null 2>&1
        
        info "$1 already exists," \
            "backup in $backupName"

        unset dirName
    fi
}

function createSymlink() {
    backup "$2"
    ln -s "$1" "$2"
}

