local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
    -- this is where you enable features that only work
    -- if there is a language server active in the file

  local opts = {buffer = bufnr}

  vim.keymap.set('n', '<C-c>', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', '<C-d>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', '<C-D>', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end


lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr }

    vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
end)

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
})

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For luasnip users.
        end,
    },


    mapping = {
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<C-m>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm with Enter key
        ['<Tab>'] = cmp.mapping.close(),
        -- Close completion menu with Ctrl-e
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },

    },
})

cmp.setup({
    ---
    -- Add your own config here...
    ---
})
