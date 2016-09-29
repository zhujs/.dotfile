PYTHON_DIR="$( (cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd) )"


installPythonPackage () {
    sudo pip install $1 > /dev/null 2>&1

    if [ $? -eq 0 ]
    then
        echo "[$1] Installation Completed"
    else
        echo "[$1] Installation Failed"
    fi
}

type ipython > /dev/null 2>&1 || installpackage ipython
type pip > /dev/null 2>&1 || installpackage python-pip

installpackage python-dev > /dev/null 2>&1
installpackage python3-dev > /dev/null 2>&1

# more packages
sudo pip install percol

unset PYTHON_DIR
