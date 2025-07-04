#!/bin/bash

repo=$(
    cd "$(dirname "$0")"
    pwd
)

#ln -sfv  $repo/bash_profile          $HOME/.bash_profile
#ln -sfv  $repo/bashrc                $HOME/.bashrc
#ln -sfv  $repo/vim/vimrc             $HOME/.vimrc
#ln -sfnv $repo/vim/vim               $HOME/.vim

ln -sfv $repo/inputrc $HOME/.inputrc
ln -sfv $repo/gitconfig $HOME/.gitconfig
ln -sfv $repo/zshrc $HOME/.zshrc
ln -sfv $repo/kw.zsh-theme $HOME/.oh-my-zsh/custom/themes/kw.zsh-theme
ln -sfv $repo/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sfnv $repo/vim/nvim $HOME/.config/nvim

mkdir -p $HOME/.hammerspoon
ln -sfv $repo/hammerspoon-init.lua $HOME/.hammerspoon/init.lua
