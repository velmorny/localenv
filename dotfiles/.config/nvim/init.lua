-- Neovim init.lua

vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

require('options')
require('keymaps')
