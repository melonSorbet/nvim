local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  -- this is where you enable features that only work
  -- if there is a language server active in the file
end

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
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<S-J>'] = cmp.mapping.select_prev_item(),
    ['<S-K>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm with Enter key
    ['<Space>'] = cmp.mapping.close(), -- Close completion menu with Ctrl-e
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
