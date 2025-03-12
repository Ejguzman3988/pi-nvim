return {
	{
		'echasnovski/mini.nvim',
		config = function()
			local statusline = require 'mini.statusline'
			local minimove = require 'mini.move'
			local minipairs = require 'mini.pairs'
			local minisplitjoin = require 'mini.splitjoin'
			local minisurround = require 'mini.surround'
			local miniclue = require 'mini.clue'
			local minidiff = require 'mini.diff'
			local minicursorword = require 'mini.cursorword'
			local miniindentscope = require 'mini.indentscope'

			miniindentscope.setup()
			minicursorword.setup()
			minidiff.setup()
			miniclue.setup()
			minisurround.setup()
			minipairs.setup()
			minisplitjoin.setup()
			statusline.setup { use_icons = true }
			minimove.setup {
				mappings = {
					-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
					left = '<S-h>',
					right = '<S-l>',
					down = '<S-j>',
					up = '<S-k>',

					-- Move current line in Normal mode
					line_left = '<M-H>',
					line_right = '<M-L>',
					line_down = '<M-J>',
					line_up = '<M-K>',
				},

				-- Options which control moving behavior
				options = {
					-- Automatically reindent selection during linewise vertical move
					reindent_linewise = true,
				},
			}
			miniclue.setup({
				triggers = {
					-- Leader triggers
					{ mode = 'n', keys = '<Leader>' },
					{ mode = 'x', keys = '<Leader>' },

					-- Built-in completion
					{ mode = 'i', keys = '<C-x>' },

					-- `g` key
					{ mode = 'n', keys = 'g' },
					{ mode = 'x', keys = 'g' },

					-- Marks
					{ mode = 'n', keys = "'" },
					{ mode = 'n', keys = '`' },
					{ mode = 'x', keys = "'" },
					{ mode = 'x', keys = '`' },

					-- Registers
					{ mode = 'n', keys = '"' },
					{ mode = 'x', keys = '"' },
					{ mode = 'i', keys = '<C-r>' },
					{ mode = 'c', keys = '<C-r>' },

					-- Window commands
					{ mode = 'n', keys = '<C-w>' },

					-- `z` key
					{ mode = 'n', keys = 'z' },
					{ mode = 'x', keys = 'z' },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			})
		end
	}
}

-- UNUSED PLUGINS
-- local minitabline = require 'mini.tabline'

-- minitabline.setup({
-- 	show_icons = true,
-- 	tabpage_section = (function()
-- 		-- Set up keymaps for buffer navigation and actions
-- 		vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Move Tab Left", noremap = true, silent = true })
-- 		vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Move Tab Right", noremap = true, silent = true })
--
-- 		local pinned_buffers = {} -- Store pinned buffers
--
-- 		-- Delete current buffer
-- 		vim.keymap.set("n", "<space>bd", ":bdelete<CR>", { desc = "Delete Buffer", noremap = true, silent = true })
--
-- 		-- Pin/Unpin the current buffer
-- 		vim.keymap.set("n", "<space>bp", function()
-- 			local buf = vim.api.nvim_get_current_buf()
-- 			if pinned_buffers[buf] then
-- 				pinned_buffers[buf] = nil
-- 				print("Unpinned buffer " .. buf)
-- 			else
-- 				pinned_buffers[buf] = true
-- 				print("Pinned buffer " .. buf)
-- 			end
--
-- 			vim.cmd("redrawtabline") -- Refresh the tabline after pinning/unpinning
-- 		end)
--
-- 		-- Close all buffers except pinned ones
-- 		vim.keymap.set("n", "<space>bP", function()
-- 			local buffers = vim.api.nvim_list_bufs()
-- 			for _, buf in ipairs(buffers) do
-- 				if vim.api.nvim_buf_is_valid(buf) and not pinned_buffers[buf] then
-- 					vim.api.nvim_buf_delete(buf, { force = true })
-- 				end
-- 			end
-- 		end, { desc = "Close All Non-Pinned Buffers", noremap = true, silent = true })
--
-- 		-- Navigate to buffer 1-9 with space + number
-- 		for i = 1, 9 do
-- 			vim.keymap.set("n", "<space>" .. i, function()
-- 				vim.cmd("buffer " .. i)
-- 			end, { desc = "Go to Buffer " .. i, noremap = true, silent = true })
-- 		end
--
-- 		-- Tabline Rendering Logic
-- 		local buffers = vim.api.nvim_list_bufs()
-- 		local pinned_tabline_items = {}
-- 		local unpinned_tabline_items = {}
--
-- 		-- Loop over buffers to categorize pinned and unpinned
-- 		for _, buf in ipairs(buffers) do
-- 			if vim.api.nvim_buf_is_loaded(buf) then
-- 				local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
-- 				local icon = pinned_buffers[buf] and "P " or "" -- Add pin icon
--
-- 				-- If pinned, add to pinned tabline items, else to unpinned
-- 				if pinned_buffers[buf] then
-- 					table.insert(pinned_tabline_items, icon .. name)
-- 				else
-- 					table.insert(unpinned_tabline_items, icon .. name)
-- 				end
-- 			end
-- 		end
--
-- 		-- Only show tabline if there are valid buffers
-- 		if #pinned_tabline_items > 0 or #unpinned_tabline_items > 0 then
-- 			-- Concatenate pinned buffers first, then unpinned buffers
-- 			local all_buffers = vim.tbl_extend("force", pinned_tabline_items, unpinned_tabline_items)
-- 			return table.concat(all_buffers, " | ") -- Return formatted tabline
-- 		else
-- 			-- return empty string to hide the tabline
-- 			return ""
-- 		end
-- 	end)()
-- })
