vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "close terminal" })

local state = {
	split = {
		buf = -1,
		win = -1
	}
}

local function create_bottom_split(opts)
	opts         = opts or {}
	local height = opts.height or math.floor(vim.o.lines * 0.3)

	-- Create the split
	vim.cmd("botright " .. height .. "split")

	local win = vim.api.nvim_get_current_win()
	local buf = nil

	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- Create a scratch buffer
	end

	return { buf = buf, win = win }
end

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.split.win) then
		state.split = create_bottom_split({ buf = state.split.buf })
		if vim.bo[state.split.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.split.win)
	end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

vim.keymap.set({ "n", "t" }, "<space>tt", toggle_terminal,
	{ noremap = true, silent = true, desc = "toggle bottom terminal" })
