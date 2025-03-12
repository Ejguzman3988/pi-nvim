-- Neovim options with defaults, explanations, and possible values
local opt = vim.opt
-- vim.opt
opt.shiftwidth = 2
opt.tabstop = 4
opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"

-- vim.o
vim.o.showmode = false
vim.o.cmdheight = 0  -- Hides command-line unless needed
vim.o.shortmess = vim.o.shortmess .. "cI"  -- Suppress completion & LSP messages

return opt
