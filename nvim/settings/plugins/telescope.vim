function! TelScGrepString()
    :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
endfun
function! TelScGitFiles()
    :lua require('telescope.builtin').git_files()
endfun
function! TelScFindFiles()
    :lua require('telescope.builtin').find_files()
endfun
function! TelScLiveGrep() 
    :lua require('telescope.builtin').live_grep()
endfun
function! TelScGrepWord() 
    :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
endfun
function! TelScBuffers() 
    :lua require('telescope.builtin').buffers()
endfun
function! TelScHelpTags() 
    :lua require('telescope.builtin').help_tags()
endfun
