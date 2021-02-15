" vim: foldmethod=marker
" vim: foldcolumn=3

" Text, färg och utseende {{{1
" Sätt på syntaxfärg
syntax on

" Visa aktuell rad
" set cul

set hidden
set lazyredraw
set nobackup
set noswapfile
set nowritebackup

" Toggla highlight searh
map <leader>hl :set hlsearch! <CR>

" Set no higligh
map <leader>nhl :set nohlsearch <CR>


if has('nvim')
    if exists('g:GuiLoaded')
        " :Guifont Source Code Pro for Powerline:h13<CR>
        :Guifont Source Code Pro for Powerline:h13
    end

    " let g:solarized_termcolors=256
    set termguicolors " used for base16 colors
    set background=dark
    colo base16-tomorrow-night-eighties

    "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
    if has('gui_running')
        colo OceanicNext
        let g:airline_theme='oceanicnext'
        " let g:airline_theme='nord'
        set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 13
        set go-=T
        set go-=l
        set go-=L
        set go-=r
        set go-=R
        set go-=m
    else
        "colo nord
        colo OceanicNext
        let g:airline_theme='oceanicnext'
        "let g:airline_theme='solarized'
        "let g:nord_comment_brightness = 18
        "let g:nord_uniform_diff_background = 1
    endif
endif

" if has("termguicolors")
"    set termguicolors
" endif

" " To handle background issues with Tmux (black background around text)
" if exists('$TMUX')
"   set term=screen-256color
" endif
" 
" " Needed in Windows 10 Bash
" set term=screen-256color
