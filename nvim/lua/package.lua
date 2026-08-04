vim.pack.add({ 
	{src = 'https://github.com/neovim/nvim-lspconfig'},
	{src = 'https://github.com/mg979/vim-visual-multi'},
	{src = 'https://github.com/junegunn/vim-easy-align'},
	{src = 'https://github.com/NeogitOrg/neogit'},
})

vim.lsp.config('rust-analyzer', {})
vim.lsp.enable('rust-analyzer')
vim.lsp.config('ts_ls', {})
vim.lsp.enable('ts_ls')

vim.keymap.set({'n'}, 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
vim.keymap.set({'n'}, 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
vim.keymap.set({'n'}, 'gr', vim.lsp.buf.references, {noremap = true, silent = true})
vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, {noremap = true, silent = true})
