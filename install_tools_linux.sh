#!/bin/bash

set -euo pipefail

if [ ! -d $HOME/bin ]; then
    mkdir $HOME/bin
fi
cd $HOME/bin

if [ -f /usr/share/git/completion/git-completion.bash ]; then
    ln -sfv /usr/share/git/completion/git-completion.bash ./git-completion.bash
elif [ -f /usr/share/bash-completion/completions/git ]; then
    ln -sfv /usr/share/bash-completion/completions/git ./git-completion.bash
else
    curl -OL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi

if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    ln -sfv /usr/share/git/completion/git-prompt.sh ./git-prompt.sh
else
    curl -OL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

curl -OL https://raw.githubusercontent.com/rupa/z/master/z.sh

cd -
