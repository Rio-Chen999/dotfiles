local function create_popup()
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
		"Hello, Nvim!",
		"This is a native float popup",
		"type 'q' to close"
	})

	local width = vim.api.nvim_get_option_value("columns", {})
	local height = vim.api.nvim_get_option_value("lines", {})

	local win_width = 60
	local win_height = 10

	local row = math.floor((height - win_height) / 2)
	local col = math.floor((width - win_width) / 2)

	local opts = {
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	}

	local win_id = vim.api.nvim_open_win(buf, true, opts)

	vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>close<CR>', {noremap = true, silent = true})
end

vim.api.nvim_create_user_command('Popup', function()
	create_popup()
end, {})
