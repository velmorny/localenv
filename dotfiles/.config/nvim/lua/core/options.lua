-- Neovim options
vim.opt.ruler = true
vim.opt.title = true
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.hidden = true
vim.opt.showmatch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.equalalways = false
vim.opt.swapfile = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.wrap = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 1500
vim.opt.whichwrap = 'b,s,h,l,<,>,~,[,]'
vim.opt.listchars = 'tab:¦_'
vim.opt.clipboard:append{'unnamedplus'}

-- Other options
---- highlight zenkaku space
vim.cmd('autocmd MyAutoCmd BufRead,BufNew * match Error /　/')
---- highlight zenkaku space
vim.cmd('autocmd InsertLeave * set nopaste')
