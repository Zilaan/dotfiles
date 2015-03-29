let maplocalleader = "-"

let g:LatexBox_viewer = "open -a /Applications/Skim.app"
let g:LatexBox_quickfix = 4
map <silent> <LocalLeader>ls :silent
			\ !/Applications/Skim.app/Contents/SharedSupport/displayline
			\ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
			\ "%:p" <CR>

imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv
nmap <buffer> <F5>   <Plug>LatexChangeEnv
vmap <buffer> <F7>   <Plug>LatexWrapSelection
vmap <buffer> <S-F7> <Plug>LatexEnvWrapSelection
imap <buffer> ((     \eqref{
