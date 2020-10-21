require'nvim_lsp'.tsserver.setup{}
require'nvim_lsp'.ccls.setup {
	cmd = { "ccls", '--init={"cache": {"directory": "/tmp/ccls-cache"}}' }
}
require'nvim_lsp'.pyls.setup{}
