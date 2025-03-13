-- init.lua:
-- plugins/telescope.lua:
return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
		require('telescope').setup {
		  defaults = {
			file_ignore_patterns = {
				".git/",
				"node_modules/",
				"build/",
				"package-lock.json",
				"yarn.lock",
				"dist/"
			}
		  },
			pickers = {
				find_files = {
					theme = "ivy",
					hidden = true,
				}
			},
			extensions = {
				fzf = {}
			}
		}

		require('telescope').load_extension('fzf')

		-- print("")
		vim.keymap.set('n', '<space>fh', require('telescope.builtin').help_tags, {desc = "Find help tags"})
		vim.keymap.set('n', '<space>ff', require('telescope.builtin').find_files, {desc = "Find Files "})
		vim.keymap.set('n', '<space>fc', function()
			require('telescope.builtin').find_files {
				cwd = vim.fn.stdpath("config")
			}
		end, { desc = "Find Config Files"})

		-- vim.keymap.set('n', '<space>ep', function()
		-- 	require('telescope.builtin').find_files {
		-- 		cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
		-- 	}
		-- end)

		require "config.telescope.multigrep".setup()
	end
}
