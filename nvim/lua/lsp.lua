-- nvim_lsp object
local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local completion = require('completion')

-- function to attach completion when setting up lsp
local on_attach = function(client)
    lsp_status.on_attach(client, bufnr)
    -- diagnostic.on_attach(client, bufnr)
    completion.on_attach(client, bufnr)

    --vim.fn.nvim_set_keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    --vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("i", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
    --vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
    --vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
    --vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
    --vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
    --vim.fn.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})

    vim.fn.nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})

    if client.resolved_capabilities.document_formatting then
        vim.fn.nvim_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
    elseif client.resolved_capabilities.document_range_formatting then
        vim.fn.nvim_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
    end

end

lsp_status.register_progress()
lsp_status.config({
    status_symbol = '',
    indicator_errors = 'e',
    indicator_warnings = 'w',
    indicator_info = 'i',
    indicator_hint = 'h',
    indicator_ok = '✔️',
    spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})


local servers = {'pyls', 'clangd', 'jsonls', 'vimls', 'yamlls'}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup{
        on_attach = on_attach,
        capabilities = lsp_status.capabilities
    }
end

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)

