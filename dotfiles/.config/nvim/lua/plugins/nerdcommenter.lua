-- options
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDCompactSexyComs = 1
vim.g.NERDTrimTrailingWhitespace = 1

-- key mappings
vim.api.nvim_set_keymap('n', '[nerdcomment]', '', { noremap = true })
vim.api.nvim_set_keymap('n', ' c', '[nerdcomment]', {})
vim.api.nvim_set_keymap('v', '[nerdcomment]', '', { noremap = true })
vim.api.nvim_set_keymap('v', ' c', '[nerdcomment]', {})
vim.api.nvim_set_keymap('n', '[nerdcomment]c', ':<C-u>call nerdcommenter#Comment("n", "Toggle")<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('v', '[nerdcomment]c', [[:<C-u>'<,'>call nerdcommenter#Comment("v", "Toggle")<CR>]], { silent = true, noremap = true })
