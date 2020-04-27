highlight ExtraWhitespace ctermfg=red
match ExtraWhitespace /\s\+$/

highlight LineBreak ctermfg=3
match LineBreak /\.\.\.\ze\s*/

setlocal foldmethod=indent

setlocal makeprg=mlint\ -id\ %
setlocal errorformat=L\ %l\ (C\ %c):\ %m,L\ %l\ (C\ %c-%*[0-9]):\ %m,%-Q
