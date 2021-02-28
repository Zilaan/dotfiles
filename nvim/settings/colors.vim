syntax on
colorscheme zephyr

let g:airline_theme='base16_oceanicnext'

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
