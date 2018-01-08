#/bin/bash

find . -type f -name '*.gpg' -print0 | xargs --null -I FILE gpg2 --batch --decrypt-files FILE
