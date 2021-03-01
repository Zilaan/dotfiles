" Author: Raman Haddad
" vim: foldmethod=marker

" --- Plugins --- {{{1
call plug#begin('~/.config/nvim/plugged/')
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'anott03/nvim-lspinstall'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Coc
Plug 'neoclide/coc.nvim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Devicons
Plug 'ryanoasis/vim-devicons'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Undotree
Plug 'mbbill/undotree'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" CPP
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
" Color schemes
Plug 'sainnhe/edge'
Plug 'glepnir/zephyr-nvim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
" Whichkey
Plug 'liuchengxu/vim-which-key'
" Unimpared
Plug 'tpope/vim-unimpaired'
" Quickscope
Plug 'unblevable/quick-scope'
" Indent guides
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

" }}}

let mapleader = "\<Space>"

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

source $HOME/.config/nvim/settings/plugins/airline.vim
source $HOME/.config/nvim/settings/plugins/clang-format.vim
source $HOME/.config/nvim/settings/plugins/coc.vim
source $HOME/.config/nvim/settings/plugins/indents.vim
source $HOME/.config/nvim/settings/plugins/lsp.vim
source $HOME/.config/nvim/settings/plugins/quickscope.vim
source $HOME/.config/nvim/settings/plugins/telescope.vim
source $HOME/.config/nvim/settings/plugins/treesitter.vim
source $HOME/.config/nvim/settings/plugins/undotree.vim
source $HOME/.config/nvim/settings/plugins/which-key.vim
source $HOME/.config/nvim/settings/colors.vim
source $HOME/.config/nvim/settings/misc.vim
source $HOME/.config/nvim/settings/netrw.vim
source $HOME/.config/nvim/settings/keys.vim
source $HOME/.config/nvim/settings/sets.vim
