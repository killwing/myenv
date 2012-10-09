#!/bin/bash

repo=$(cd "$(dirname "$0")"; pwd)

ln -sf $repo/gitconfig $HOME/.gitconfig
ln -sf $repo/bash_profile $HOME/.bash_profile
ln -sf $repo/bashrc $HOME/.bashrc
ln -sf $repo/inputrc $HOME/.inputrc
ln -sf $repo/vim/vimrc $HOME/.vimrc
ln -sf $repo/vim/vim $HOME/.vim
ln -sf $repo/jshintrc $HOME/.jshintrc
