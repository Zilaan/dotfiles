lua require("lsp")

" Disable completion auto popup
let g:completion_enable_auto_popup = 1

" LSP hover doc for completion
let g:completion_enable_auto_hover = 1

" Auto signature
let g:completion_enable_auto_signature = 0

imap <silent> <c-p> <Plug>(completion_trigger)
imap <silent> <c-n> <Plug>(completion_trigger)

function! RamanLspDefinition()
    :lua vim.lsp.buf.definition()
endfunction
function! RamanLspDeclaration()
    :lua vim.lsp.buf.declaration()
endfunction
function! RamanLspHover()
    :lua vim.lsp.buf.hover()
endfunction
function! RamanLspCodeAction()
    :lua vim.lsp.buf.code_action()
endfunction
function! RamanLspCodeReferences()
    :lua vim.lsp.buf.references()
endfunction
function! RamanLspRename()
    :lua vim.lsp.buf.rename()
endfunction
function! RamanLspPrevError()
    :lua vim.lsp.diagnostic.goto_prev()
endfunction
function! RamanLspNextError()
    :lua vim.lsp.diagnostic.goto_prev()
endfunction
function! RamanLspFormat()
    :lua vim.lsp.buf.formatting()
endfunction
function! RamanLspLocationDiagnose()
    :lua vim.lsp.diagnostic.set_loclist()
endfunction
