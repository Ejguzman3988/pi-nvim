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
			local minitabline = require 'mini.tabline'

			minitabline.setup()
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
