require("mason-lspconfig").setup {
    ensure_installed = {
      "lua_ls",
      "gopls"
    },
}

require('mason-lspconfig').setup_handlers {
  function(server_name)
    local opt = {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]', '', { noremap = true })
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ' j', '[lsp]', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]dc', ':<C-u>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]df', ':<C-u>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]a', ':<C-u>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]h', ':<C-u>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]i', ':<C-u>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]s', ':<C-u>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]lw', ':<C-u>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]t', ':<C-u>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]rn', ':<C-u>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]rf', ':<C-u>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]e', ':<C-u>lua vim.diagnostic.open_float()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]p', ':<C-u>lua vim.diagnostic.goto_prev()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]n', ':<C-u>lua vim.diagnostic.goto_next()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]f', ':<C-u>lua vim.lsp.buf.format({async = true})<CR>', opts)
      end
    }
    opt.capabilities.textDocument.completion.completionItem.snippetSupport = true
    if server_name == 'gopls' then
      opt.settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true
        }
      }
    end
    require('lspconfig')[server_name].setup(opt)
  end
}

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-h>'] = cmp.mapping.complete(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-l>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "path" },
    { name = "cmdline" },
  },
})
