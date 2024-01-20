set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if exists('g:vscode')
  " disable mapping of vim-go
  let g:go_def_mapping_enabled = 0
  " disable numbers https://github.com/vscode-neovim/vscode-neovim/issues/742
  let g:enable_numbers = 0
endif
