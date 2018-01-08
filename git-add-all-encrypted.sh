#/bin/bash

find . -type f -name '*.gpg' -print0 | xargs --null git add
