local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'rust_analyzer',
    'gopls',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-j>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-k>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})
local cmp_action = require('lsp-zero').cmp_action()
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})
require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = {
        ['<C-n>'] = cmp_action.luasnip_jump_forward(),
        ['<C-p>'] = cmp_action.luasnip_jump_backward(),
    }
})

lsp.set_preferences({
})

lsp.on_attach(function(client, bufnr)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { buffer = bufnr, remap = false, desc = 'go to definition' })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {
        buffer = bufnr,
        remap = false,
        desc = 'show documentation'
    })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        { buffer = bufnr, remap = false, desc = 'view workspace symbols' })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        { buffer = bufnr, remap = false, desc = 'view diagnostics' })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end,
        { buffer = bufnr, remap = false, desc = 'previous diagnostic' })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end,
        { buffer = bufnr, remap = false, desc = 'next diagnostic' })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        { buffer = bufnr, remap = false, desc = 'view code actions' })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
        { buffer = bufnr, remap = false, desc = 'view references' })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {
        buffer = bufnr,
        remap = false,
        desc = 'rename'
    })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        { buffer = bufnr, remap = false, desc = 'signature help' })
    vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end,
        { buffer = bufnr, remap = false, desc = 'format file' })
end)

lsp.setup()
