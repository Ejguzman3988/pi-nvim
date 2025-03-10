require("config.lazy")

local set = vim.opt
set.shiftwidth = 2
set.tabstop = 4
set.number = true
set.relativenumber = true
set.clipboard = "unnamedplus"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Execute current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Execute highlighted line" })
vim.keymap.set('n', '<space>e', ':Ex<CR>', { desc = "Go to explorer" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Alternative Escape" })

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
