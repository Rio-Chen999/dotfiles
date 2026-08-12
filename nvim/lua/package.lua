vim.pack.add({ 
	{src = 'https://github.com/mg979/vim-visual-multi'},
	{src = 'https://github.com/junegunn/vim-easy-align'},
	{src = 'https://github.com/NeogitOrg/neogit'},
	{src = 'https://github.com/neoclide/coc.nvim', branch = 'release'},
})

vim.keymap.set({'n'}, 'gd', "<Plug>(coc-definition)", {noremap = true, silent = true})
vim.keymap.set({'n'}, 'gy', "<Plug>(coc-type-definition)", {noremap = true, silent = true})
vim.keymap.set({'n'}, 'gi', "<Plug>(coc-implementation)", {noremap = true, silent = true})
vim.keymap.set({'n'}, 'gr', "<Plug>(coc-references)", {noremap = true, silent = true})
