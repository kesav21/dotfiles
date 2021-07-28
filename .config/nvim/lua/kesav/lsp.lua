local has_lspconfig, lspconfig = pcall(require, "lspconfig")
if not has_lspconfig then
	print("lua/kesav/lsp.lua: install neovim/nvim-lspconfig")
	return
end
local has_completion, completion = pcall(require, "completion")
if not has_completion then
	print("lua/kesav/lsp.lua: install nvim-lua/completion-nvim")
end
local has_telescope, telescope_builtin = pcall(require, "telescope.builtin")
if not has_telescope then
	print("lua/kesav/lsp.lua: install nvim-telescope/telescope.nvim")
end
if not vim.keymap then
	print("lua/kesav/lsp.lua: install tjdevries/astronauta.nvim")
end
local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap

local function on_attach(client)
	print('attached lsp client')

	if has_completion then
		vim.o.completeopt = "menuone,noinsert,noselect"
		vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
		completion.on_attach(client)
	end

	if vim.keymap then
		nnoremap { '<c-]>' , vim.lsp.buf.definition }
		nnoremap { 'gi' , vim.lsp.buf.implementation }
		nnoremap { 'gd' , vim.lsp.buf.type_definition }
		nnoremap { 'gr' , vim.lsp.buf.references }
		nnoremap { 'K'  , vim.lsp.buf.hover }
		inoremap { '<c-k>' , vim.lsp.buf.signature_help }
		nnoremap { '<leader>rn', vim.lsp.buf.rename }
		nnoremap { '<leader>k' , vim.lsp.diagnostic.show_line_diagnostics }
		nnoremap { '<leader>dl', vim.lsp.diagnostic.set_loclist }
		if has_telescope then
			nnoremap { '<leader>ca', telescope_builtin.lsp_code_actions }
		end
	end

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
	cmd = {
		"haskell-language-server-wrapper",
		"--lsp",
		"--logfile",
		"/home/kesav/hls.log",
		"--debug"
	},
	filetypes = { 'haskell' },
	on_attach = on_attach
}
lspconfig.terraformls.setup {
	cmd = { "terraform-lsp" },
	on_attach = on_attach
}
lspconfig.rust_analyzer.setup {
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				allFeatures = true,
				overrideCommand = {
					"cargo",
					"clippy",
					"--workspace",
					"--message-format=json",
					"--all-targets",
					"--all-features"
				}
			}
		}
	}
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
