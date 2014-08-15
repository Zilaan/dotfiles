let maplocalleader = "-"

let g:LatexBox_viewer = "open -a /Applications/Skim.app"
let g:LatexBox_quickfix = 4
map <silent> <LocalLeader>ls :silent
			\ !/Applications/Skim.app/Contents/SharedSupport/displayline
			\ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
			\ "%:p" <CR>
