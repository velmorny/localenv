-- Glocal options
vim.o.ruler = true
vim.o.title = true
vim.o.wildmenu = true
vim.o.showcmd = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.showmatch = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.equalalways = false
vim.o.cmdheight = 2
vim.o.whichwrap = 'b,s,h,l,<,>,~,[,]'
vim.o.clipboard = 'unnamedplus'

-- Buffer local options
vim.bo.swapfile = false
vim.bo.autoindent = true
vim.bo.smartindent = true

-- Window local options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.list = true
vim.wo.wrap = false
vim.wo.listchars = 'tab:¦_'

-- Other options
---- highlight zenkaku space
vim.cmd('autocmd MyAutoCmd BufRead,BufNew * match Error /　/')
---- highlight zenkaku space
vim.cmd('autocmd InsertLeave * set nopaste')
