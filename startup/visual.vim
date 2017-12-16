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

"if (has("termguicolors"))
"    set termguicolors
"endif

" Use correct codes to get italic text
"set t_ZH=[3m
"set t_ZR=[0m
set t_ZH="\e[3m"
set t_ZR="\e[23m"

colo nord
let g:airline_theme='nord'
" }}}

" Custom folding settings {{{1
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}
