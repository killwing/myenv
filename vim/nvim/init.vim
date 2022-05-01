set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if exists('g:vscode')
  " disable mapping of vim-go
  let g:go_def_mapping_enabled = 0
endif
