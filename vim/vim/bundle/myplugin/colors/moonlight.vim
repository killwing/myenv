" Vim color file
" This colorscheme only for term use and set t_Co=8 is perferred.
" This colorscheme script was modified from David Lazar's darkdot colorscheme.

" NR-16 NR-8    COLOR NAME
" 0	    0	    Black
" 1	    4	    DarkBlue
" 2	    2	    DarkGreen
" 3	    6	    DarkCyan
" 4	    1	    DarkRed
" 5	    5	    DarkMagenta
" 6	    3	    Brown, DarkYellow
" 7	    7	    LightGray, LightGrey, Gray, Grey
" 8	    0*	    DarkGray, DarkGrey
" 9	    4*	    Blue, LightBlue
" 10    2*	    Green, LightGreen
" 11    6*	    Cyan, LightCyan
" 12    1*	    Red, LightRed
" 13    5*	    Magenta, LightMagenta
" 14    3*	    Yellow, LightYellow
" 15    7*	    White

" cterm=none/bold/underline/reverse/italic

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="moonlight"

hi Normal        cterm=none
hi Cursor        cterm=none
hi Directory                         ctermfg=cyan
hi DiffAdd       ctermbg=blue        ctermfg=yellow
hi DiffDelete    ctermbg=black       ctermfg=darkgray
hi DiffChange    ctermbg=black
hi DiffText      ctermbg=black       ctermfg=darkred
hi ErrorMsg      ctermbg=darkred     ctermfg=white
hi Folded        ctermbg=black       ctermfg=darkblue
hi IncSearch     ctermbg=black       ctermfg=gray
hi LineNr                            ctermfg=yellow
hi ModeMsg                           ctermfg=white
hi MoreMsg                           ctermfg=green
hi NonText                           ctermfg=blue
hi Question                          ctermfg=yellow
hi Search        ctermbg=none        ctermfg=green
hi SpecialKey                        ctermfg=blue
hi StatusLine    cterm=none ctermbg=darkcyan    ctermfg=white
hi StatusLineNC  cterm=none ctermbg=gray        ctermfg=black
hi Title         ctermfg=white
hi Visual        cterm=none ctermbg=gray        ctermfg=black
hi WarningMsg                                   ctermfg=yellow
hi link CursorIM Cursor
hi link FoldColumn Folded
hi link VertSplit StatusLineNC
hi link VisualNOS Visual

" syntax highlighting groups
hi Comment     ctermfg=blue
hi Constant    ctermfg=darkcyan
hi Identifier  ctermfg=white
hi Statement   ctermfg=cyan
hi PreProc     ctermfg=darkcyan
hi Type        ctermfg=white
hi Special     ctermfg=blue
hi Underlined  ctermfg=blue
hi Ignore      ctermfg=darkgray
hi Error       ctermbg=black              ctermfg=darkred
hi Todo        ctermbg=darkred            ctermfg=yellow

hi link Character      Constant
hi link Number         Constant
hi link Boolean        Constant
hi link Float          Number
hi link Conditional    Statement
hi link Label          Statement
hi link Keyword        Statement
hi link Exception      Statement
hi link Repeat         Statement
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Statement
hi link Structure      Type
hi link Typedef        Type
hi link Tag            Special
hi link Delimiter      Special
hi link SpecialComment Special
hi link Debug          Special
hi link FoldColumn     Folded
