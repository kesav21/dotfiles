local lspconfig = require('lspconfig')

function on_attach(client)
	print('attached lsp client')

	vim.api.nvim_set_keymap('n', 'gd'        , '<cmd>lua vim.lsp.buf.definition()<CR>'     , {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', 'gi'        , '<cmd>lua vim.lsp.buf.implementation()<CR>' , {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', 'gt'        , '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', 'gr'        , '<cmd>lua vim.lsp.buf.references()<CR>'     , {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', 'K'         , '<cmd>lua vim.lsp.buf.hover()<CR>'          , {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>'         , {noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>'    , {noremap = true, silent = true})
	vim.api.nvim_set_keymap('i', '<c-k>'     , '<cmd>lua vim.lsp.buf.signature_help()<CR>' , {noremap = true, silent = true})

	vim.o.completeopt = "menuone,noinsert,noselect"
	vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
end

lspconfig.tsserver.setup {
	on_attach = on_attach
}
lspconfig.ccls.setup {
	cmd = { "ccls", '--init={"cache": {"directory": "/tmp/ccls-cache"}}' },
	on_attach = on_attach
}
lspconfig.pyls.setup {
	on_attach = on_attach
}
lspconfig.gopls.setup {
	on_attach = on_attach
}
