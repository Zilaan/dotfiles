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
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'schickling/vim-bufonly'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/gundo.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'tmhedberg/matchit'
Plugin 'qstrahl/vim-matchmaker'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Shougo/neocomplete.vim'
Plugin 'paradigm/SkyBison'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'gcmt/taboo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'w0ng/vim-hybrid'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/tlib'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mhinz/vim-startify'


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

