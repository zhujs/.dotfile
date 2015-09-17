
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups

# numbers of trailing directory components to retain in the promting string
# PROMPT_DIRTRIM=3



# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# prevent from inadvertently overwriting an existing file
set -o noclobber

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Cursor Movement using escape sequences, <L>, <C>, <N> should be replaced with numbers, `tput` is the encouraged way to send the escape sequences
# More infomation about escape sequence:
#   https://en.wikipedia.org/wiki/ANSI_escape_code
#
# Puts the cursor at line L and column C.
#   \033[<L>;<C>H Or \033[<L>;<C>f
# Move the cursor up N lines:
#   \033[<N>A
# Move the cursor down N lines:
#   \033[<N>B
# Move the cursor forward N columns:
#   \033[<N>C
# Move the cursor backward N columns:
#   \033[<N>D
#
# Clear the screen, move to (0,0):
#   \033[2J
# Erase to end of line:
#   \033[K
# Save cursor position:
#   \033[s
# Restore cursor position:
#   \033[u

if [ "$color_prompt" = yes ]; then
    # "\e[sm", where s is a semicolon-delimited list of ANSI color codes
    # example: "\e[31;44;1m"
    # The codes:
    # 0  restore default color
    # 1  brighter
    # 2  dimmer
    # 4  underlined text
    # 5  flashing text
    # 7  reverse video
    #           black  red  green  yellow  blue  purple  cyan  white
    # foreground  30    31    32    33    34       35    36      37
    # background  40    41    42    43    44       45    46      47
    #
    # the escape sequence "\e]0;s\a" is used to set the title of an xterm,
    # where s is the string you want to use
    PS1='${debian_chroot:+($debian_chroot)}\[\e[1;32m\]\u@\h:\w\$\[\e[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" ;;
*)
    ;;
esac

# put all your additions into a separate file
if [ -f ~/.bash_config ]; then
    . ~/.bash_config
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


if [ -d ~/bin ]; then
    export PATH="$PATH:~/bin"
fi


# Local bin
PATH=~/Bin:$PATH

# JAVA
JAVA_HOME=/home/zhujs/Bin/jdk1.7.0_79
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_HOME
export CLASSPATH

# MAVEN
export M2_HOME=/home/zhujs/Bin/apache-maven-3.2.5
export PATH=$M2_HOME/bin:$PATH

# Intellij
export PATH=$PATH:/home/zhujs/Bin/idea-IC-141.713.2/bin

# Hadoop
export HADOOP_HOME=/home/zhujs/Bin/hadoop-2.4.1
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HADOOP_HOME/lib

# Hive
export HIVE_HOME=/home/zhujs/Bin/hive-0.13.1
export PATH=$PATH:$HIVE_HOME/bin 

# Hbase
export HBASE_HOME=/home/zhujs/Bin/hbase-0.94.10-su1
export PATH=$PATH:$HBASE_HOME/bin
