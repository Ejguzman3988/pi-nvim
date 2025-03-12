vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "close terminal" })

local state = {
	split = {
		buf = nil,
		win = nil
	}
}

local function create_bottom_split()
	local height = math.floor(vim.o.lines * 0.3)

	-- Create the split at the bottom
	vim.cmd("botright " .. height .. "split")

	local win = vim.api.nvim_get_current_win()
	local buf = state.split.buf

	if buf and vim.api.nvim_buf_is_valid(buf) then
		-- Reuse the existing buffer
		vim.api.nvim_win_set_buf(win, buf)
	else
		-- Create a new buffer if needed
		buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_win_set_buf(win, buf)
		vim.cmd.terminal()
		state.split.buf = buf -- Save the buffer for reuse
	end

	-- Save the window ID for toggling
	state.split.win = win

	-- Move into terminal mode
	vim.cmd("startinsert")
end

local function toggle_terminal()
	if state.split.win and vim.api.nvim_win_is_valid(state.split.win) then
		-- Hide the terminal window
		vim.api.nvim_win_hide(state.split.win)
		state.split.win = nil
	else
		create_bottom_split()
	end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

vim.keymap.set({ "n", "t" }, "<space>tt", toggle_terminal,
	{ noremap = true, silent = true, desc = "toggle bottom terminal" })
