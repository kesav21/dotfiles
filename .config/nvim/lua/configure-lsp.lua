require'lspconfig'.tsserver.setup {
	-- TODO: fix; doesn't print kk
	on_attach = function(client)
		print('kk')
	end
}
require'lspconfig'.ccls.setup {
	cmd = { "ccls", '--init={"cache": {"directory": "/tmp/ccls-cache"}}' }
}
require'lspconfig'.pyls.setup{}
require'lspconfig'.gopls.setup{}
