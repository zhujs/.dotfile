#!/usr/bin/bin bash

SCRIPT_DIR="$( (cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd) )"

for name in $(\ls $SCRIPT_DIR)
do
    [ -d "$SCRIPT_DIR/$name" ] && [ -f "$SCRIPT_DIR/$name/setup.sh" ] \
    && source "$SCRIPT_DIR/$name/setup.sh"
done

unset SCRIPT_DIR
