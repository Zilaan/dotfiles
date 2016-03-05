" Author: Raman Haddad
"
" vim: foldmethod=marker
" vim: foldcolumn=3

" Activate "Pathogen"
" call pathogen#infect()

" Misc
" filetype plugin on
" filetype indent on


set nocompatible              " be iMproved, required

call plug#begin('~/.vim/bundle')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'rking/ag.vim'                     " Ag
Plug 'bling/vim-airline'                " Airline
Plug 'ntpeters/vim-better-whitespace'   " Better-whitespace
Plug 'schickling/vim-bufonly'           " Bufonly
Plug 'kien/ctrlp.vim'                   " CtrlP
Plug 'junegunn/vim-easy-align'          " Easy-align
Plug 'easymotion/vim-easymotion'        " Easymotion
Plug 'tpope/vim-fugitive'               " Fugitive
Plug 'airblade/vim-gitgutter'           " Gitgutter
Plug 'junegunn/goyo.vim'                " Goyo
Plug 'sjl/gundo.vim'                    " Gundo
Plug 'w0ng/vim-hybrid'                  " Hybrid
Plug 'haya14busa/incsearch.vim'         " Incsearch
Plug 'tmhedberg/matchit'                " Matchit
Plug 'qstrahl/vim-matchmaker'           " Matchmaker
Plug 'MarcWeber/vim-addon-mw-utils'     " Mw-utils
Plug 'scrooloose/nerdtree'              " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'      " NerdTree-git
Plug 'Shougo/neocomplete.vim'           " NeoComplete
Plug 'NLKNguyen/papercolor-theme'       " PaperColor
Plug 'paradigm/SkyBison'                " Skybison
Plug 'junegunn/seoul256.vim'            " Seoul256
Plug 'altercation/vim-colors-solarized' " Solarized
Plug 'mhinz/vim-startify'               " Startify
Plug 'tpope/vim-surround'               " Surround
Plug 'scrooloose/syntastic'             " Syntastic
Plug 'gcmt/taboo.vim'                   " Taboo
Plug 'majutsushi/tagbar'                " Tagbar
Plug 'abudden/taghighlight-automirror'  " TagHighlight
Plug 'beloglazov/vim-online-thesaurus'  " Thesaurus
Plug 'vim-scripts/tlib'                 " Tlib
Plug 'SirVer/ultisnips'                 " Ultisnips
Plug 'mbbill/undotree'                  " Undotree
Plug 'tpope/vim-unimpaired'             " Unimpared
Plug 'https://github.com/lervag/vimtex' " Vimtex

call plug#end()

set rtp+=~/.fzf

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

