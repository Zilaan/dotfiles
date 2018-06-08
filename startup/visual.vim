" vim: foldmethod=marker
" vim: foldcolumn=3

" Text, färg och utseende {{{1
" Sätt på syntaxfärg
syntax on

" Visa aktuell rad
" set cul

set lazyredraw

" Toggla highlight searh
map <leader>hl :set hlsearch! <CR>

" Set no higligh
map <leader>nhl :set nohlsearch <CR>


if has('gui_running')
    colo OceanicNext
    let g:airline_theme='oceanicnext'
    " let g:airline_theme='nord'
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 11
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R
    set go-=m
else
    colo nord
    let g:airline_theme='nord'
    let g:nord_comment_brightness = 18
    let g:nord_uniform_diff_background = 1
endif

" if (has("termguicolors"))
"    set termguicolors
" endif

" To handle background issues with Tmux (black background around text)
if exists('$TMUX')
  set term=screen-256color
endif

" Needed in Windows 10 Bash
set term=screen-256color
