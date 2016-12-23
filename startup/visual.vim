" vim: foldmethod=marker
" vim: foldcolumn=3

" Text, färg och utseende {{{1
" Välj typsnitt
set gfn=Sauce\ Code\ Powerline\ Regular:h15

" Sätt på syntaxfärg
syntax on

" Visa aktuell rad
set cul

" Toggla highlight searh
map <leader>hl :set hlsearch! <CR>

" Set no higligh
map <leader>nhl :set nohlsearch <CR>

set t_Co=256
set t_ut=

if (has("termguicolors"))
    set termguicolors
endif

" Use correct codes to get italic text
"set t_ZH=[3m
"set t_ZR=[0m
set t_ZH="\e[3m"
set t_ZR="\e[23m"

" OceanicNext {{{1
colo OceanicNext
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_italic = 1 " enable italics, disabled by default
let g:oceanic_next_terminal_bold = 1   " enable bold, disabled by default
" }}} OceanicNext

" Colors {{{1
    "hi clear LineNr
    "hi LineNr ctermfg=white ctermbg=black
    "hi clear CursorLineNr
    "hi CursorLineNr ctermfg=209 ctermbg=00
    "hi clear FoldColumn
    "hi FoldColumn ctermfg=32 ctermbg=black
    "hi clear Comment
    "hi Comment ctermfg=250 ctermbg=00
    "hi clear Folded
    "hi Folded ctermfg=242 ctermbg=235
    "hi clear CursorLine
    "hi CursorLine ctermbg=233

    "highlight clear SpellBad
    "highlight SpellBad cterm=underline ctermbg=00 ctermfg=209
    "
    "highlight clear SpellCap
    "highlight SpellCap cterm=underline ctermbg=00 ctermfg=47
    "
    "highlight clear SpellLocal
    "highlight SpellLocal cterm=underline ctermbg=00 ctermfg=32
" }}}
