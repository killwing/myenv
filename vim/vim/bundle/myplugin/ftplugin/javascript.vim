if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setl cinoptions=:0g0t0(sus
setl cindent
setl isk+=-

" overrule
inoremap <buffer> { {<CR>}<ESC>O
