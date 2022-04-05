local util = require "lspconfig/util"
local servers = {}

-- options
---- golang
local golang_settings = {
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  single_file_support = true,
  settings = {
    gopls = {
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    }
  },
}
servers["gopls"] = golang_settings

-- key mappings
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua:vim.lsp.omnifunc')
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]', '', { noremap = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ' j', '[lsp]', {})
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]D', ':<C-u>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]d', ':<C-u>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]a', ':<C-u>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]h', ':<C-u>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]i', ':<C-u>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]s', ':<C-u>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]wa', ':<C-u>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]wr', ':<C-u>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]wl', ':<C-u>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]t', ':<C-u>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]r', ':<C-u>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]R', ':<C-u>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]g', ':<C-u>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]p', ':<C-u>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]n', ':<C-u>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]f', ':<C-u>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- mapping
for lsp, config in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    cmd = config.cmd,
    filetypes = config.filetypes,
    root_dir = config.root_dir,
    single_file_support = config.single_file_support,
    settings = config.settings,
  }
end
