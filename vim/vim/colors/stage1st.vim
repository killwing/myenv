" Vim color file
" Maintainer: ts1egats 
" Last Change:  2006 March 16
" Version:1.0
" URL: http://bbs.stage1st.com

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="stage1st"

hi Normal       guifg=#022C60	guibg=#F6F7EB    ctermfg=Black  ctermbg=white
hi Title        guifg=#022C60   guibg=#F6F7EB    ctermfg=Black  ctermbg=white  gui=BOLD
hi Cursor       guifg=#F6F7EB   guibg=#022C60    ctermfg=white  ctermbg=black
hi LineNr       guifg=#022C80   guibg=#D1D9C1    ctermfg=Black  ctermbg=white
hi StatusLine   guifg=#CCCC99   guibg=#022C80	 ctermfg=Black  ctermbg=white
hi StatusLineNC guifg=#CCCC99   guibg=#022C80	 ctermfg=Black  ctermbg=white
hi Visual       guifg=#F6F7EB   guibg=#022C60  ctermfg=white ctermbg=black

hi Comment    ctermfg=Green guifg=#008040  gui=NONE
hi Operator   ctermfg=Green guifg=#008040  gui=NONE
hi Identifier ctermfg=Green guifg=#008000  gui=NONE
hi Statement  ctermfg=Blue  guifg=#0000c8  gui=NONE
hi TypeDef    ctermfg=Blue  guifg=#0000c8  gui=NONE
hi Type       ctermfg=Blue  guifg=#0000c8  gui=NONE
hi Boolean    ctermfg=Blue  guifg=#0000c8  gui=NONE
hi PreProc	  ctermfg=Blue  guifg=#0000C8  gui=NONE
hi String     ctermfg=Yellow  guifg=#FF791F  gui=NONE
hi Number     ctermfg=Yellow  guifg=#FF791F  gui=NONE
hi Constant   ctermfg=Yellow  guifg=#FF791F  gui=NONE
hi Function   ctermfg=Green guifg=#008040  gui=NONE
hi Keyword	  ctermfg=Green guifg=#008040  gui=NONE

