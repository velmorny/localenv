require("toggleterm").setup{}

vim.api.nvim_set_keymap('n', '[term]', '', { noremap = true })
vim.api.nvim_set_keymap('n', ' t', '[term]', {})
vim.api.nvim_set_keymap('n', '[term]t', ':<C-u>exe v:count1 . "ToggleTerm"<CR>', {})
