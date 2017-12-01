" Author: Raman Haddad
"
" vim: foldmethod=marker
" vim: foldcolumn=3

" General settings {{{
set t_Co=256

if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim


set backspace=2 " Make 'backspace' behaive like other programs
set nocompatible " No Vi compatibility
set langmenu=none
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=sv
set mouse=a
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set termencoding=utf-8
set colorcolumn=91
set showcmd " Show commands while typing
set clipboard=unnamedplus " Use system clipboard for pasting
" }}}

" Rader, tabbar och indrag relaterad {{{1
set number " Show line numbers
set laststatus=2 " Always show status line
set wrap " Wrap long lines
set linebreak " No line break at word
set foldmethod=syntax " Use syntax for folding
set textwidth=0 " Window decides line wrap
set ts=4 " Number of space used for tab
set sts=4 " Number of spaces for tab in insert mode
set sw=4 " Indentation is done in 4 spaces
set shiftround " Round indentation using 'sw'
set incsearch " Show search live
set hlsearch " Highlight all searches
set autoindent " Use previous line indent new line is started
set smartindent " Smart indentation
set cindent " Automatic indent like in C programs
set list " Show character for tabs, end on line etc
set listchars=eol:¬,extends:»,tab:\|\ ,trail:› " Chars for list
set showbreak=… " Char to show linebreak
" }}}

" QuickFix window {{{1
" Set quickfix window size
augroup quickfix_size
    autocmd!
    au FileType qf call AdjustWindowHeight(2, 10)
augroup END

function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
" }}}

" Show last search {{{1
" Vimgrep for last searched word
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" }}}

" Command line popup {{{
set wildmenu
set completeopt=menuone,preview
" }}}

" Keep folds when editing {{{1
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
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
