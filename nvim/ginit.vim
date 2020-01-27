"execute "Guifont Source Code Pro for Powerline:h11"
execute "Guifont Hack:h12"

" Check if in nvim-gtk
if exists('g:GtkGuiLoaded')
    execute "Guifont DroidSansMono Nerd Font Mono:h12"
    "execute "Guifont Fira Code:h12"

    " Disable external tabline
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
endif
