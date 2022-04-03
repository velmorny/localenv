-- options
-- nothig

-- key mappings
vim.api.nvim_set_keymap('n', '[fugitive]', '', { noremap = true })
vim.api.nvim_set_keymap('n', ' g', '[fugitive]', {})
vim.api.nvim_set_keymap('n', '[fugitive]<CR>', ':<C-u>Git<CR>', {})
vim.api.nvim_set_keymap('n', '[fugitive]s', ':<C-u>Git status<CR>', {})
