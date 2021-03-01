" vim: foldmethod=marker
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Timeout
let g:which_key_timeout = 100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

" Create map to add keys to
let g:which_key_map =  {}

" Define a separator
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings {{{1
"let g:which_key_map['/'] = [ ':call Comment()'                                 , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                                     , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'                                       , 'commands' ]
let g:which_key_map['='] = [ '<C-W>='                                          , 'balance windows' ]
let g:which_key_map['e'] = [ ':CocCommand explorer --toggle --sources=file+'   , 'explorer' ]
let g:which_key_map['E'] = [ ':CocCommand explorer --toggle --preset floating --sources=file+'   , 'explorer' ]
let g:which_key_map['h'] = [ '<C-W>s'                                          , 'split below']
let g:which_key_map['n'] = [ ':let @/ = ""'                                    , 'no highlight' ]
let g:which_key_map['p'] = [ ':Files'                                          , 'search files' ]
let g:which_key_map['T'] = [ ':TSHighlightCapturesUnderCursor'                 , 'treesitter highlight' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                                 , 'undo tree']
let g:which_key_map['v'] = [ '<C-W>v'                                          , 'split right']
" }}}

" a is for actions {{{1
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'e' : [':CocCommand explorer'    , 'explorer'],
      \ 'h' : [':let @/ = ""'            , 'remove search highlight'],
      \ 'n' : [':set nonumber!'          , 'line-numbers'],
      \ 's' : [':s/\%V\(.*\)\%V/"\1"/'   , 'surround'],
      \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
      \ 'w' : [':call TrimWhitespace()'        , 'strip whitespace'],
      \ }
" }}}

" g is for git {{{1
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':CocCommand fzf-preview.GitStatus' , 'actions'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 'S' : [':CocCommand fzf-preview.GitStatus' , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }
" }}}

" l is for language server protocol {{{1
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'd' : [':call RamanLspDefinition()'       , 'definition'],
      \ 'D' : [':call RamanLspDeclaration()'      , 'declaration'],
      \ 'K' : [':call RamanLspHover()'            , 'hover'],
      \ 'l' : [':call RamanLspLocationDiagnose()' , 'diagnostic list'],
      \ 'a' : [':call RamanLspCodeAction()'       , 'code action'],
      \ 'r' : [':call RamanLspCodeReferences()'   , 'references'],
      \ ']' : [':call RamanLspNextError()'        , 'next error'],
      \ '[' : [':call RamanLspPrevError()'        , 'prev error'],
      \ 'f' : [':call RamanLspFormat()'           , 'format'],
      \ }
" }}}

" s is for search {{{1
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/' , 'history'],
      \ 'c' : [':Commits' , 'commits'],
      \ 'C' : [':BCommits' , 'buffer commits'],
      \ 'G' : [':GFiles?' , 'modified git files'],
      \ 'h' : [':History' , 'file history'],
      \ 'H' : [':History:' , 'command history'],
      \ 'l' : [':Lines' , 'lines'] ,
      \ 'M' : [':Maps' , 'normal maps'] ,
      \ 'p' : [':Helptags' , 'help tags'] ,
      \ 'P' : [':Tags' , 'project tags'],
      \ 'S' : [':Colors' , 'color schemes'],
      \ 't' : [':Rg' , 'text Rg'],
      \ 'w' : [':Windows' , 'search windows'],
      \ 'y' : [':Filetypes' , 'file types'],
      \ 'z' : [':FZF' , 'FZF'],
      \ }
" }}}

" t is for telescope {{{1
let g:which_key_map.t = {
      \ 'name' : '+telescope' ,
      \ 'g' : [':call TelScGrepString()' , 'grep string'],
      \ 'F' : [':call TelScGitFiles()'   , 'git files'],
      \ 'f' : [':call TelScFindFiles()'  , 'find files'],
      \ 'l' : [':call TelScLiveGrep()'   , 'live grep'],
      \ 'w' : [':call TelScGrepWord()'   , 'grep word'],
      \ 'b' : [':call TelScBuffers()'    , 'buffers'],
      \ 'h' : [':call TelScHelpTags()'   , 'help tags'],
      \ }
" }}}

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
