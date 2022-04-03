-- Neovim init.lua

vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

vim.cmd('filetype off')
vim.cmd('syntax off')

vim.g.cache_home = vim.fn.expand('$HOME/.cache')
vim.g.config_home = vim.fn.expand('$HOME/.config')
local dein_cache_dir = vim.g.cache_home .. '/dein'
local dein_repo_dir = dein_cache_dir ..  '/repos/github.com/Shougo/dein.vim'

if not string.find(vim.api.nvim_get_option('runtimepath'), 'dein.vim') then
  if not (vim.fn.isdirectory(dein_repo_dir) == 1) then
    os.execute('git clone https://github.com/Shougo/dein.vim ' .. dein_repo_dir)
  end
  vim.api.nvim_set_option('runtimepath', dein_repo_dir .. ',' .. vim.api.nvim_get_option('runtimepath'))
end

if (vim.fn['dein#load_state'](dein_cache_dir) == 1) then
  vim.fn['dein#begin'](dein_cache_dir)
  local toml_dir = vim.g.config_home .. '/dein'
  vim.fn['dein#load_toml'](toml_dir .. '/dein.toml', { lazy = 0 })
  vim.fn['dein#load_toml'](toml_dir .. '/deinlazy.toml', { lazy = 1 })
  vim.fn['dein#end']()
  vim.fn['dein#save_state']()
end

if (vim.fn['dein#check_install']() ~= 0) then
  vim.fn['dein#install']()
end

require('dein')
require('options')
require('keymaps')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
