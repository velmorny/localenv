-- options

-- key mappings
vim.api.nvim_set_keymap('n', '[telescope]', '', { noremap = true })
vim.api.nvim_set_keymap('n', ' t', '[telescope]', {})
vim.api.nvim_set_keymap('n', '[telescope]f', ':<C-u>Telescope find_files hidden=true theme=get_dropdown<CR>', {})
vim.api.nvim_set_keymap('n', '[telescope]l', ':<C-u>Telescope live_grep theme=get_dropdown<CR>', {})
vim.api.nvim_set_keymap('n', '[telescope]b', ':<C-u>Telescope buffers theme=get_dropdown<CR>', {})
vim.api.nvim_set_keymap('n', '[telescope]o', ':<C-u>Telescope oldfiles theme=get_dropdown<CR>', {})
vim.api.nvim_set_keymap('n', '[telescope]g', ':<C-u>Telescope git_branches theme=get_dropdown<CR>', {})
