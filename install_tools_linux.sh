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

# z
curl -OL https://raw.githubusercontent.com/rupa/z/master/z.sh

# hub
curl -L -o hub.tgz https://github.com/github/hub/releases/download/v2.12.3/hub-linux-amd64-2.12.3.tgz && tar xzvf hub.tgz && rm hub.tgz
ln -svf hub-linux-amd64-2.12.3/bin/hub ./hub

# sift
curl -L -o sift.tgz https://sift-tool.org/downloads/sift/sift_0.9.0_linux_amd64.tar.gz && tar xzvf sift.tgz && rm sift.tgz
cp sift_0.9.0_linux_amd64/sift ./sift && \rm -rf ./sift_0.9.0_linux_amd64

# fd
curl -L -o fd.deb https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb && dpkg -i fd.deb && rm fd.deb

# kubectx
curl -L -o kubectl-ctx https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx && chmod +x kubectl-ctx
curl -L -o kubectl-ns https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens && chmod +x kubectl-ns

# kube-ps1
curl -OL https://raw.githubusercontent.com/jonmosco/kube-ps1/master/kube-ps1.sh

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git .fzf && .fzf/install --bin
ln -sfv .fzf/bin/fzf ./fzf

# bat
curl -L -o bat.deb https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb && dpkg -i bat.deb && rm bat.deb

cd -
