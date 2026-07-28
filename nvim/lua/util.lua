local function reload_lua_files(dir)
	local function is_lua_file(filename)
		return filename:match("%.lua$")
	end

	local directory_files = vim.fn.readdir("./lua", 1)
	for _, file in ipairs(directory_files) do
		if is_lua_file(file) then
			local module_name = string.gsub(file, "%.%w+$", "")
			if package.loaded[module_name] then
				package.loaded[module_name] = nil
				require(module_name)
			end
		end
	end
	print("Reload Config successfully!")
end

vim.api.nvim_create_user_command('ReloadConfig', function()
	reload_lua_files('./lua')
end, {})

vim.keymap.set({'n'}, '<F1>', '<cmd>ReloadConfig<CR>', {noremap = true, silent = true})
