" Author: Raman Haddad
"
" vim: foldmethod=marker
" vim: foldcolumn=3

set shell=/bin/bash

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'schickling/vim-bufonly'           " BufOnly
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'kien/ctrlp.vim'                   " CtrlP
Plug 'junegunn/vim-easy-align'          " Easy align
Plug 'easymotion/vim-easymotion'        " Easy motion
Plug 'tpope/vim-fugitive'               " Fugitive
Plug 'junegunn/goyo.vim'                " Goyo
Plug 'haya14busa/incsearch.vim'         " Incsearch
Plug 'qstrahl/vim-matchmaker'           " Matchmaker
Plug 'tmhedberg/matchit'                " Matchit
Plug 'scrooloose/nerdtree'              " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'      " NerdTree Git
Plug 'mhartington/oceanic-next'         " Oceanic-next
Plug 'junegunn/rainbow_parentheses.vim' " Rainbow parentheses
Plug 'mhinz/vim-sayonara'               " Sayonara
Plug 'junegunn/seoul256.vim'            " Seoul256
Plug 'w0ng/vim-hybrid'                  " Hybrid colors
Plug 'scrooloose/syntastic'             " Syntastic
Plug 'nvie/vim-flake8'                  " Flake8
Plug 'tpope/vim-surround'               " Surround
Plug 'gcmt/taboo.vim'                   " Taboo
Plug 'majutsushi/tagbar'                " Tagbar
Plug 'SirVer/ultisnips'                 " Ultisnips
Plug 'tpope/vim-unimpaired'             " Unimpared
Plug 'Valloric/YouCompleteMe'           " YouCompelteMe
Plug 'rdnetto/YCM-Generator'            " YCM generator
"Plug 'gorodinskiy/vim-coloresque'


call plug#end()
" Misc
filetype plugin on
filetype indent on

" Sätt "," som <leader>
let mapleader=","

" Load "Settings"
source ~/.vim/startup/settings.vim

" Load "Mappings"
source ~/.vim/startup/mappings.vim

" Load "Plugins"
source ~/.vim/startup/plugins.vim

" Load "Visual"
source ~/.vim/startup/visual.vim

set t_Co=256
set t_ut=

if (has("termguicolors"))
    set termguicolors
endif

colo OceanicNext
" Use correct codes to get italic text
set t_ZH=[3m
set t_ZR=[0m

let g:airline_theme='oceanicnext'
" enable italics, disabled by default
let g:oceanic_next_terminal_italic = 1
" enable bold, disabled by default
let g:oceanic_next_terminal_bold = 1


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

" Spelling colors {{{1
"	highlight clear SpellBad
"	highlight SpellBad cterm=underline ctermbg=00 ctermfg=209

"	highlight clear SpellCap
"	highlight SpellCap cterm=underline ctermbg=00 ctermfg=47

"	highlight clear SpellLocal
"	highlight SpellLocal cterm=underline ctermbg=00 ctermfg=32
" }}}
