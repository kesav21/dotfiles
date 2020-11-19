require'nvim_lsp'.tsserver.setup {
	-- TODO: fix; doesn't print kk
	on_attach = function(client)
		print('kk')
	end
}
require'nvim_lsp'.ccls.setup {
	cmd = { "ccls", '--init={"cache": {"directory": "/tmp/ccls-cache"}}' }
}
require'nvim_lsp'.pyls.setup{}
require'nvim_lsp'.gopls.setup{}
