# output information


function info() {
    # "$@" is equivalent to "$1" "$2" ...
    echo -e "$@"
}

# used to install the packages
function installpackage() {
    local installCommand=""
    
    info "Try to install $1 ..."
    
    if type "$1" > /dev/null 2>&1; then
        info "$1 already exists."
        return
    fi

    # determine how to install the package
    if [ $(uname)x == "Linux"x ]; then
        type apt-get > /dev/null 2>&1 && installCommand="apt-get -y install" 
        # type yum > /dev/null 2>&1 && installCommand="yum -y install" 
    elif [ $(uname)x == "Darwin"x ]; then
        # install the package manager tool for OS X if necessary
        if ! type brew &> /dev/null
        then
            info "Trying to install Homebrew..."
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            info "Installation Completed."
        fi
        installCommand="brew install"
    fi 

    if [ -z installCommand ]; then
        info "Cannot find the command-line package tool."
    else
        eval "sudo $installCommand $1"
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
        
        info "It seems that $1 already exists," \
            "have made a backup at $backupName"

        unset dirName
    fi
}

function createSymlink() {
    backup "$2"
    ln -s "$1" "$2"
}

