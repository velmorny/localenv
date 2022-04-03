-- options
vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_sign_added = '+'
vim.g.gitgutter_sign_modified = '*'
vim.g.gitgutter_sign_removed = '-'
vim.g.gitgutter_sign_removed_first_line = '^'
vim.g.gitgutter_sign_modified_removed = '<'

-- key mappings
vim.api.nvim_set_keymap('n', '[gitgutter]', '', { noremap = true })
vim.api.nvim_set_keymap('n', ' l', '[gitgutter]', {})
vim.api.nvim_set_keymap('n', '[gitgutter]n', ':<C-u>GitGutterNextHunk<CR>', {})
vim.api.nvim_set_keymap('n', '[gitgutter]p', ':<C-u>GitGutterPrevHunk<CR>', {})
vim.api.nvim_set_keymap('n', '[gitgutter]f', ':<C-u>GitGutterFold<CR>', {})
vim.api.nvim_set_keymap('n', '[gitgutter]h', ':<C-u>GitGutterLineHighlightsToggle<CR>', {})
