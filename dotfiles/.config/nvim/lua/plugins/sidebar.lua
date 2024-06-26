vim.api.nvim_set_keymap('n', '[sidebar]', '', { noremap = true })
vim.api.nvim_set_keymap('n', ' s', '[sidebar]', {})
vim.api.nvim_set_keymap('n', '[sidebar]s', ':<C-u>SidebarNvimToggle<CR>', {})

require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = true,
    side = "left",
    initial_width = 50,
    hide_statusline = false,
    update_interval = 1000,
    sections = { "files", "buffers", "symbols", "diagnostics", "git" },
    section_separator = {"", "-----", ""},
    section_title_separator = {""},
    files = {
      show_hidden = true,
      ignored_paths = {"%.DS_Store$"},
    },
    containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
    buffers = { ignored_buffers = {"SidebarNvim_*"} },
})
