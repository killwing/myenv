#!/bin/bash

repo=$(cd "$(dirname "$0")"; pwd)

ln -sfnv $repo                       $HOME/.myenv    # self reference
ln -sfv  $repo/gitconfig             $HOME/.gitconfig
ln -sfv  $repo/bash_profile          $HOME/.bash_profile
ln -sfv  $repo/bashrc                $HOME/.bashrc
ln -sfv  $repo/zshrc                 $HOME/.zhrc
ln -sfv  $repo/inputrc               $HOME/.inputrc
ln -sfv  $repo/vim/vimrc             $HOME/.vimrc
ln -sfnv $repo/vim/vim               $HOME/.vim
