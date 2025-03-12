require("config.lazy")
require("config.options")


vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Execute current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Execute highlighted line" })
vim.keymap.set('n', '<space>e', ':Oil<CR>', { desc = "Go to explorer" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Alternative Escape" })

vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Change window up" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Change window down" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Change window left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Change window right" })

vim.keymap.set('n', "<M-o>", "<cmd>copen<CR>", { desc = "Quickfix open" })
vim.keymap.set('n', "<M-j>", "<cmd>cnext<CR>", { desc = "Quickfix Next" })
vim.keymap.set('n', "<M-k>", "<cmd>cnprev<CR>", { desc = "Quickfix prev" })

vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Move Tab Left", noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Move Tab Right", noremap = true, silent = true })

-- git
vim.keymap.set("n", "<leader>ghd", "<cmd>lua MiniDiff.toggle_overlay()<CR>", { desc = "Toggle diff overlay" })


-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})


vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})



-- local job_id = 0

-- vim.keymap.set("n", "<space>st", function()
-- 	vim.cmd.vnew()
-- 	vim.cmd.term()
-- 	vim.cmd.wincmd("J")
-- 	vim.api.nvim_win_set_height(0, 15)
--
-- 	-- job_id = vim.bo.channel
-- end)
--
-- vim.keymap.set("n", "<space>test", function()
-- 	vim.fn.chansend(job_id, { "echo 'hi'\r\n" })
-- end)
--
vim.diagnostic.config({
	virtual_text = true,     -- Show diagnostics inline
	signs = true,            -- Keep signs in the sign column
	underline = true,        -- Underline problematic code
	update_in_insert = false, -- Avoid updates while typing
})


vim.notify = require("mini.notify").make_notify()

vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
	local client = vim.lsp.get_client_by_id(ctx.client_id)
	require("mini.notify").make_notify()(result.message, ({
		"ERROR", "WARN", "INFO", "DEBUG",
	})[result.type], { title = client and client.name or "LSP" })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{ virtual_text = false, signs = true, update_in_insert = false }
)
