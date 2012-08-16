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

iabbr <buffer> hg <ESC>"%pgUUI#ifndef <ESC>f.R_<ESC>o<ESC>"%pgUUI#define <ESC>f.R_<ESC>o<ESC>"%pgUUI#endif // <ESC>f.R_<ESC><C-cr>O<CR><C-cr><C-R>=EatChar('\s')<CR>
iabbr <buffer> #h <ESC>"%pT.DAh"<ESC>I#include "<ESC>o<CR><C-R>=EatChar('\s')<CR>
iabbr <buffer> uns using namespace;<LEFT>
iabbr <buffer> #i #include
iabbr <buffer> #d #define
iabbr <buffer> try try {<ESC>dda<SPACE>catch (const Exception& e<RIGHT><SPACE>{<ESC>ddkO<C-R>=EatChar('\s')<CR>
iabbr <buffer> switch {case 0:<CR>break;<CR>default:<CR>break;<ESC>[{i<SPACE><LEFT>switch<SPACE>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> if {<ESC>ddk$i<SPACE><LEFT>if<SPACE>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> ifel {<ESC>dda<SPACE>else<SPACE>{<ESC>ddkki<SPACE><LEFT>if<SPACE>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> while {<ESC>ddki<SPACE><LEFT>while<SPACE>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> do do {<ESC>dda<SPACE>while<SPACE>;<LEFT>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> for {<ESC>ddki<SPACE><LEFT>for<SPACE>(<C-R>=EatChar('\s')<CR>
iabbr <buffer> fori {<ESC>ddki<SPACE><LEFT>for<SPACE>(int i = 0; i != ; ++i<C-o>F;<C-R>=EatChar('\s')<CR>
iabbr <buffer> class {public:<DOWN>;<ESC>kki<SPACE><LEFT>class<SPACE><C-R>=EatChar('\s')<CR>

