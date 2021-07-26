local lspconfig  = require('lspconfig')
local completion = require('completion')

local telescope_builtin = require("telescope.builtin")

local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap

local function on_attach(client)
	print('attached lsp client')

	completion.on_attach(client)

	vim.o.completeopt = "menuone,noinsert,noselect"
	vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

	nnoremap { '<c-]>' , vim.lsp.buf.definition }
	nnoremap { 'gi' , vim.lsp.buf.implementation }
	nnoremap { 'gd' , vim.lsp.buf.type_definition }
	nnoremap { 'gr' , vim.lsp.buf.references }
	nnoremap { 'K'  , vim.lsp.buf.hover }
	inoremap { '<c-k>' , vim.lsp.buf.signature_help }
	nnoremap { '<leader>rn', vim.lsp.buf.rename }
	nnoremap { '<leader>k' , vim.lsp.diagnostic.show_line_diagnostics }
	nnoremap { '<leader>ca', telescope_builtin.lsp_code_actions }
	nnoremap { '<leader>dl', vim.lsp.diagnostic.set_loclist }

	vim.cmd [[ inoremap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>" ]]
	vim.cmd [[ inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>" ]]
end

lspconfig.tsserver.setup {
	on_attach = on_attach
}
lspconfig.clangd.setup {
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes",
		"--clang-tidy",
		"--header-insertion=iwyu",
	},
	on_attach = on_attach
}
lspconfig.pylsp.setup {
	on_attach = on_attach
}
lspconfig.gopls.setup {
	on_attach = on_attach
}
lspconfig.vimls.setup {
	on_attach = on_attach
}
lspconfig.hls.setup {
	cmd = { "haskell-language-server-wrapper", "--lsp", "--logfile", "/home/kesav/hls.log", "--debug" },
	filetypes = { 'haskell' },
	on_attach = on_attach
}
lspconfig.terraformls.setup {
	cmd = { "terraform-lsp" },
	on_attach = on_attach
}
lspconfig.rust_analyzer.setup {
	on_attach = on_attach
}


local sumneko_root_path = vim.fn.stdpath('cache') .. '/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"
-- file must have .lua extension
lspconfig.sumneko_lua.setup {
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
		-- luacheck = {
		-- 	checkOnSave = {
		-- 		allFeatures = true,
		-- 		overrideCommand = { "luacheck", }
		-- 	}
		-- }
	},
	on_attach = on_attach
}
