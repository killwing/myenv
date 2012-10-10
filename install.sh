#!/bin/bash

repo=$(cd "$(dirname "$0")"; pwd)

ln -sv $repo/gitconfig $HOME/.gitconfig
ln -sv $repo/bash_profile $HOME/.bash_profile
ln -sv $repo/bashrc $HOME/.bashrc
ln -sv $repo/inputrc $HOME/.inputrc
ln -sv $repo/vim/vimrc $HOME/.vimrc
ln -snv $repo/vim/vim $HOME/.vim
ln -sv $repo/jshintrc $HOME/.jshintrc
