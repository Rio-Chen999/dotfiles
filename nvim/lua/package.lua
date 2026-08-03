vim.pack.add({ 
	{src = 'https://github.com/neovim/nvim-lspconfig'}
})

vim.lsp.config('rust-analyzer', {})
vim.lsp.enable('rust-analyzer')
vim.lsp.config('ts_ls', {})
vim.lsp.enable('ts_ls')

vim.keymap.set({'n'}, 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
vim.keymap.set({'n'}, 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
vim.keymap.set({'n'}, 'gr', vim.lsp.buf.references, {noremap = true, silent = true})
vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, {noremap = true, silent = true})
