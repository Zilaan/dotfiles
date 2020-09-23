" Author: Raman Haddad
"
" vim: foldmethod=marker
" vim: foldcolumn=3

set shell=/bin/bash
set path=.,/usr/include/,,**

set encoding=utf8
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

redir => s
silent! version
redir END
let g:nvim_version = matchstr(s, 'NVIM v\zs[^-\n]*')

if g:nvim_version == "0.5.0"
    let g:use_builtin_lsp = 1
else
    let g:use_builtin_lsp = 0
endif

" Plugins {{{1
" === FZF === "
" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" === Vim-Airline === "
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tmhedberg/SimpylFold'

" === Yarp === "
Plug 'roxma/nvim-yarp'

" === BufOnly === "
" Close all other buffers
Plug 'schickling/vim-bufonly'

" === CPP-enhanced-highlight === "
" Better syntax for c/c++
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" === Easy align === "
" Ailgn stuff
Plug 'junegunn/vim-easy-align'

" === Easy motion === "
" Easy navigation
Plug 'easymotion/vim-easymotion'

" === Unimpared === "
Plug 'tpope/vim-unimpaired'

" === Markdown === "
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" === Python-syntax === "
Plug 'hdima/python-syntax'
Plug 'nvie/vim-flake8'

" === Fugitive === "
" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" === Incsearch === "
Plug 'haya14busa/incsearch.vim'

" === MATLAB === "
Plug 'vim-scripts/MatlabFilesEdition'

" === NerdTree === "
" Plug 'scrooloose/nerdtree'

" === NerdTree git === "
Plug 'Xuyuanp/nerdtree-git-plugin'

" === Gruvbox colors === "
Plug 'morhetz/gruvbox'

" === Tagbar === "
Plug 'majutsushi/tagbar'

" === coc.nvim === "
" Intellisense Engine
if !g:use_builtin_lsp
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
endif
" === Denite === "
" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

" === NeoSnippet === "
" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" === Icons === "
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" === Goyo === "
Plug 'junegunn/goyo.vim'

" === NerdTree icons === "
Plug 'ryanoasis/vim-devicons'

" === Papercollor === "
Plug 'NLKNguyen/papercolor-theme'

Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'rhysd/git-messenger.vim'

" === nvim-lsp === "
if g:use_builtin_lsp
    Plug 'neovim/nvim-lsp'
endif
" }}}

call plug#end()

" Misc
filetype plugin on
filetype indent on

" Sätt "," som <leader>
let mapleader=","

" Load "Settings"
source ~/.config/nvim/startup/settings.vim

" Load "Mappings"
source ~/.config/nvim/startup/mappings.vim

" Load "Plugins"
source ~/.config/nvim/startup/plugins.vim

" Load "Visual"
source ~/.config/nvim/startup/visual.vim

" Highlight Trailing spaces {{{1
highlight ExtraWhitespace ctermfg=red guifg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}}

highlight Normal guibg=NONE
highlight Normal ctermbg=NONE
highlight Comment cterm=italic
