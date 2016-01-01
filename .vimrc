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
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'             " Vundle
Plugin 'tpope/vim-fugitive'               " Fugitive
Plugin 'rking/ag.vim'                     " Ag
Plugin 'bling/vim-airline'                " Airline
Plugin 'ntpeters/vim-better-whitespace'   " Better-whitespace
Plugin 'schickling/vim-bufonly'           " Bufonly
Plugin 'kien/ctrlp.vim'                   " CtrlP
Plugin 'junegunn/vim-easy-align'          " Easy-align
Plugin 'easymotion/vim-easymotion'        " Easymotion
Plugin 'airblade/vim-gitgutter'           " Gitgutter
Plugin 'sjl/gundo.vim'                    " Gundo
Plugin 'haya14busa/incsearch.vim'         " Incsearch
Plugin 'tmhedberg/matchit'                " Matchit
Plugin 'qstrahl/vim-matchmaker'           " Matchmaker
Plugin 'scrooloose/nerdtree'              " NerdTree
Plugin 'Xuyuanp/nerdtree-git-plugin'      " NerdTree-git
Plugin 'Shougo/neocomplete.vim'           " NeoComplete
Plugin 'paradigm/SkyBison'                " Skybison
Plugin 'tpope/vim-surround'               " Surround
Plugin 'scrooloose/syntastic'             " Syntastic
Plugin 'gcmt/taboo.vim'                   " Taboo
Plugin 'majutsushi/tagbar'                " Taboo
Plugin 'w0ng/vim-hybrid'                  " Hybrid
Plugin 'mbbill/undotree'                  " Undotree
Plugin 'tpope/vim-unimpaired'             " Unimpared
Plugin 'vim-scripts/tlib'                 " Tlib
Plugin 'MarcWeber/vim-addon-mw-utils'     " Mw-utils
Plugin 'mhinz/vim-startify'               " Startify
Plugin 'https://github.com/lervag/vimtex' " Vimtex
Plugin 'SirVer/ultisnips'                 " Ultisnips



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


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

