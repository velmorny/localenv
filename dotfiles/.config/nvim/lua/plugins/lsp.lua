local util = require 'lspconfig/util'
local servers = {}

-- options
---- golang
local golang_settings = {
  -- debug mode
  -- cmd = {"gopls", "serve", "-rpc.trace", "--debug=localhost:6060"};
  cmd = {'gopls', 'serve'},
  filetypes = {'go', 'gomod', 'gotmpl'},
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
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
servers['gopls'] = golang_settings

function orgimports(timeouts)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeouts)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, 'utf-8')
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end
vim.cmd('autocmd BufWritePre *.go lua orgimports(1000)')

----- dart
local dart_settings = {
  cmd = { 'dart', 'language-server', '--protocol=lsp' },
  filetypes = { 'dart' },
  root_dir = util.root_pattern('pubspec.yaml'),
  single_file_support = true,
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTools = true
    }
  },
}
servers['dartls'] = dart_settings

-- key mappings
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.smart_stab()
    return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end

vim.api.nvim_set_keymap('i', 'ff', '<C-x><C-o>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-f>', 'v:lua.smart_tab()', { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-d>', 'v:lua.smart_stab()', { expr = true, noremap = true })
vim.cmd('autocmd FileType go,gomod,gotmpl,dart setlocal omnifunc=v:lua.vim.lsp.omnifunc')

local on_attach = function(client, bufnr)
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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]g', ':<C-u>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]p', ':<C-u>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]n', ':<C-u>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[lsp]f', ':<C-u>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- setting config
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
