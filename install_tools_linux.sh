#!/bin/bash

set -euo pipefail

if [ ! -d $HOME/bin ]; then
    mkdir $HOME/bin
fi
cd $HOME/bin

# git completion
if [ -f /usr/share/git/completion/git-completion.bash ]; then
    ln -sfv /usr/share/git/completion/git-completion.bash ./git-completion.bash
elif [ -f /usr/share/bash-completion/completions/git ]; then
    ln -sfv /usr/share/bash-completion/completions/git ./git-completion.bash
else
    curl -OL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi

# git prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    ln -sfv /usr/share/git/completion/git-prompt.sh ./git-prompt.sh
else
    curl -OL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi


# sift
curl -L -o sift.tgz https://sift-tool.org/downloads/sift/sift_0.9.0_linux_amd64.tar.gz && tar xzvf sift.tgz && rm sift.tgz
cp sift_0.9.0_linux_amd64/sift ./sift && \rm -rf ./sift_0.9.0_linux_amd64

# fd
curl -L -o fd.deb https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb && dpkg -i fd.deb && rm fd.deb

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git .fzf && .fzf/install --bin
ln -sfv .fzf/bin/fzf ./fzf

# bat
curl -L -o bat.deb https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb && dpkg -i bat.deb && rm bat.deb

# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# krew
curl -OL https://github.com/kubernetes-sigs/krew/releases/download/v0.3.4/krew.tar.gz

# apt
apt install autojump jq

cd -

