vim.api.nvim_set_keymap('n', '[neovim]', '', { noremap = true })
vim.api.nvim_set_keymap('n', '  ', '[neovim]', {})
vim.api.nvim_set_keymap('n', '[neovim]w', ':<C-u>w<CR>', {})
vim.api.nvim_set_keymap('n', '[neovim]w', ':<C-u>w<CR>', {})

vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { silent = true, noremap = true })

vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':<C-u>nohlsearch<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '/', '/\\v', {})

vim.api.nvim_set_keymap('t', 'jj', '<C-\\><C-n>', { silent = true, noremap = true })
