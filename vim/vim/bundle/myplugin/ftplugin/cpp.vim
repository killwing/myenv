if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setl cinoptions=:0g0t0(sus
setl cindent
"setl textwidth=80
"setl cinkeys=    
"setl foldmethod=indent

" overrule
inoremap <buffer> < <
inoremap <buffer> { {<CR>}<ESC>O
