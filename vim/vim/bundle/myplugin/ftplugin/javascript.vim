if exists("b:did_ftplugin")
  finish
endif

setl isk+=-

" overrule
inoremap <buffer> { {<CR>}<ESC>O
