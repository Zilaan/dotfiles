" Author: Raman Haddad
"
" vim: foldmethod=marker
" vim: foldcolumn=3

" General settings {{{
set tags=./tags;
set t_Co=256

if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
set backspace=2
set nocompatible
set langmenu=none
set fileencodings=ucs-bom,utf-8,default,latin1
set guitablabel=%M%t
set helplang=sv
set mouse=a
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set termencoding=utf-8
set colorcolumn=81
set showcmd
set clipboard=unnamed
" }}}

" Rader, tabbar och indrag relaterad {{{1
" Sätt på radnumrering
set number

" Statusbar ska alltid vara på
set laststatus=2

" Slå på radbrytning
set wrap

" Ingen radbrytning vid ord
set linebreak

" Textvikningsmetod ska va syntaxberoende
set foldmethod=syntax

" Textvikning ska va fönsterberoende
set textwidth=0

" 1 tab ska va 4 mellanslag
set ts=4
set sts=4
set sw=4
set expandtab
set shiftround

" Sökning ska ske i realtid
set incsearch

" Markera alla sökta ord
set hlsearch

" Slå på automatisk styckeindrag
set autoindent
set smartindent

" Styckeindrag ska göras som i C-programmering
set cindent

" Sätt på list
set list

" Inställningar för list
set listchars=eol:¬,extends:»,tab:\|\ ,trail:›

" Börja 'linebreak' med …
set showbreak=…
" }}}

" QuickFix window {{{1
augroup quickfix_size
    autocmd!
    au FileType qf call AdjustWindowHeight(2, 10)
augroup END
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0

" Show last search {{{2
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" }}}
" }}}

" Error Toggles {{{1

command! ErrorsToggle call ErrorsToggle()
function! ErrorsToggle() " {{{
    if exists("w:is_error_window")
        unlet w:is_error_window
        exec "q"
    else
        exec "Errors"
        lopen
        let w:is_error_window = 1
    endif
endfunction " }}}

command! -bang -nargs=? QFixToggle call QFixToggle(<bang>0)
function! QFixToggle(forced) " {{{
    if exists("g:qfix_win") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction " }}}

nmap <silent> <f3> :ErrorsToggle<cr>
nmap <silent> <f4> :QFixToggle<cr>

" }}}

" Command line popup {{{
set wildmenu
set completeopt=menuone,preview
" }}}

" Keep folds when edeting {{{1
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
" }}}
