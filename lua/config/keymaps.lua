local optsFun = function(desc)
	return {
		desc = desc,
		noremap = true,
		silent = true,
	}
end

local setKey = function(mode, keymap, command, desc)
	vim.keymap.set(mode, keymap, command, optsFun(desc))
end

-- Vim Stuffs
setKey("i", "jk", "<Esc>", "Escaping insert mode")
setKey("n", "<leader>h", ":noh<CR>", "Clear Search Highlighting")
setKey("n", "<leader>w", ":up<CR>", "Smart save (skip if buffer unchanged)")
setKey("n", "<space><space>x", "<cmd>source %<CR>", "Source current file")
setKey("n", "<space>x", ":.lua<CR>", "Execute current line")
setKey("v", "<space>x", ":lua<CR>", "Execute highlighted line")
setKey("n", "<space>e", ":Oil<CR>", "Go to explorer")

-- Window Stuffs
setKey("n", "<C-k>", "<C-w><C-k>", "Change window up")
setKey("n", "<C-j>", "<C-w><C-j>", "Change window down")
setKey("n", "<C-h>", "<C-w><C-h>", "Change window left")
setKey("n", "<C-l>", "<C-w><C-l>", "Change window right")
setKey("n", "<space>-", "<C-w>_", "Full screen Window")
setKey("n", "<space>=", "<C-w>=", "Equal size window")

-- Quickfix stuffs
setKey("n", "<M-o>", "<cmd>copen<CR>", "Quickfix open")
setKey("n", "<M-j>", "<cmd>cnext<CR>", "Quickfix Next")
setKey("n", "<M-k>", "<cmd>cnprev<CR>", "Quickfix prev")

-- git
setKey("n", "<leader>ghd", "<cmd>lua MiniDiff.toggle_overlay()<CR>", "Toggle diff overlay")
