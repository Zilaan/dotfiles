" Author: Raman Haddad
"
" vim: foldmethod=marker
" vim: foldcolumn=3

set shell=/bin/bash
set path=.,/usr/include/,,**

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Plugins {{{1
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'                         " Ale
Plug 'tmhedberg/SimpylFold'             " SimplyIFold
Plug 'ncm2/ncm2'                        " Autocomplete
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'Chiel92/vim-autoformat'           " Formater
Plug 'schickling/vim-bufonly'           " BufOnly
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'junegunn/vim-easy-align'          " Easy align
Plug 'easymotion/vim-easymotion'        " Easy motion
Plug 'tpope/vim-fugitive'               " Fugitive
Plug 'airblade/vim-gitgutter'           " GitGutter
Plug 'morhetz/gruvbox'                  " Gruvbox
Plug 'haya14busa/incsearch.vim'         " Incsearch
Plug 'qstrahl/vim-matchmaker'           " Matchmaker
Plug 'tmhedberg/matchit'                " Matchit
Plug 'vim-scripts/MatlabFilesEdition'   " MATLAB
Plug 'scrooloose/nerdtree'              " NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'      " NerdTree Git
Plug 'scrooloose/nerdcommenter'         " NERDCommenter
Plug 'arcticicestudio/nord-vim'         " Nord theme
Plug 'mhartington/oceanic-next'         " Oceanic-next
Plug 'sonph/onehalf'                    " Onehalf
"Plug 'junegunn/rainbow_parentheses.vim' " Rainbow parentheses
Plug 'frazrepo/vim-rainbow'             " vim-rainbow
Plug 'NLKNguyen/papercolor-theme'       " PaperColor
Plug 'hdima/python-syntax'              " Python syntax
Plug 'nvie/vim-flake8'                  " Flake8
Plug 'tpope/vim-surround'               " Surround
Plug 'majutsushi/tagbar'                " Tagbar
Plug 'SirVer/ultisnips'                 " Ultisnips
Plug 'tpope/vim-unimpaired'             " Unimpared

"Plug 'Valloric/YouCompleteMe'           " YouCompelteMe
"Plug 'rdnetto/YCM-Generator'            " YCM generator
"Plug 'gorodinskiy/vim-coloresque'
Plug 'jnurmine/Zenburn'                 " Zenburn
" }}}

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

" Highlight Trailing spaces {{{1
highlight ExtraWhitespace ctermfg=red guifg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}}
