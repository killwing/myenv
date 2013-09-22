if exists("b:did_ftplugin")
  finish
endif

"setl textwidth=80
"setl cinkeys=    
"setl foldmethod=indent

" overrule
inoremap <buffer> < <
inoremap <buffer> { {<CR>}<ESC>O
