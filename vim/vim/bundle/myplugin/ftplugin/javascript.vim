if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setl cinoptions=:0g0t0(sus |
setl cindent |
setl textwidth=80 |
setl isk+=-

" overrule
inoremap <buffer> { {<CR>}<ESC>O

iabbr <buffer> try try {<ESC>dda<SPACE>catch (const Exception& e<RIGHT><SPACE>{<ESC>ddkO<C-R>=EatChar('\s')<CR>
iabbr <buffer> switch {case 0:<CR>break;<CR>default:<CR>break;<ESC>[{i<SPACE><LEFT>switch<SPACE>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> if {<ESC>ddki<SPACE><LEFT>if<SPACE>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> ifel {<ESC>dda<SPACE>else<SPACE>{<ESC>ddkki<SPACE><LEFT>if<SPACE>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> while {<ESC>ddki<SPACE><LEFT>while<SPACE>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> do do {<ESC>dda<SPACE>while<SPACE>;<LEFT>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> for {<ESC>ddki<SPACE><LEFT>for<SPACE>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> fori {<ESC>ddki<SPACE><LEFT>for<SPACE>(var i = 0; i != ; ++i<C-o>F;<C-R>=EatChar('\s')<CR>
iabbr <buffer> func {<ESC>dda;<ESC>k$i<SPACE><LEFT>function(<C-R>=EatChar('\s')<CR>


