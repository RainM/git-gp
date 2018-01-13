#/bin/bash

if [[ -z $KEY_ROOT ]] ; then
    KEY_ROOT=./
fi;

MY_KEY=$(cat $KEY_ROOT/my_key 2> /dev/null)

if [[ -z "$MY_KEY" ]]; then
    echo "Please specify your key"
    echo "echo \"YOUR_KEY\" > $(readlink -f $KEY_ROOT/my_key)"
    echo "And try one more time"
    exit 1
fi;

find . -type f -print0 | grep -zvE '.*\.gpg$' | grep -zv '.git' | grep -zv '.*~' | grep -zvE '.*\#$' | xargs --null -I FILE gpg2 --batch --yes -r "$MY_KEY" --encrypt FILE
