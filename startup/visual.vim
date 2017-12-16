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
