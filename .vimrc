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
Plug 'VundleVim/Vundle.vim'             " Vundle
Plug 'rking/ag.vim'                     " Ag
Plug 'bling/vim-airline'                " Airline
Plug 'ntpeters/vim-better-whitespace'   " Better-whitespace
Plug 'schickling/vim-bufonly'           " Bufonly
Plug 'kien/ctrlp.vim'                   " CtrlP
Plug 'junegunn/vim-easy-align'          " Easy-align
Plug 'easymotion/vim-easymotion'        " Easymotion
Plug 'tpope/vim-fugitive'               " Fugitive
Plug 'airblade/vim-gitgutter'           " Gitgutter
Plug 'sjl/gundo.vim'                    " Gundo
Plug 'haya14busa/incsearch.vim'         " Incsearch
Plug 'tmhedberg/matchit'                " Matchit
Plug 'qstrahl/vim-matchmaker'           " Matchmaker
Plug 'scrooloose/nerdtree'              " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'      " NerdTree-git
Plug 'Shougo/neocomplete.vim'           " NeoComplete
Plug 'NLKNguyen/papercolor-theme'       " PaperColor
Plug 'paradigm/SkyBison'                " Skybison
Plug 'altercation/vim-colors-solarized' " Solarized
Plug 'tpope/vim-surround'               " Surround
Plug 'scrooloose/syntastic'             " Syntastic
Plug 'gcmt/taboo.vim'                   " Taboo
Plug 'majutsushi/tagbar'                " Tagbar
Plug 'abudden/taghighlight-automirror'  " TagHighlight
Plug 'w0ng/vim-hybrid'                  " Hybrid
Plug 'mbbill/undotree'                  " Undotree
Plug 'tpope/vim-unimpaired'             " Unimpared
Plug 'vim-scripts/tlib'                 " Tlib
Plug 'MarcWeber/vim-addon-mw-utils'     " Mw-utils
Plug 'mhinz/vim-startify'               " Startify
Plug 'https://github.com/lervag/vimtex' " Vimtex
Plug 'SirVer/ultisnips'                 " Ultisnips
Plug 'beloglazov/vim-online-thesaurus'  " Thesaurus

call plug#end()

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

