local has_lspconfig, lspconfig = pcall(require, "lspconfig")
if not has_lspconfig then
	print "lua/kesav/lsp.lua: install neovim/nvim-lspconfig"
	return
end
local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not has_cmp_nvim_lsp then
	print "lua/kesav/lsp.lua: install simrat39/rust-tools.nvim"
end
local has_rusttools, rusttools = pcall(require, "rust-tools")
if not has_rusttools then
	print "lua/kesav/lsp.lua: install simrat39/rust-tools.nvim"
end

local function on_attach()
	print "attached lsp client"

	vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition)
	vim.keymap.set("n", "gm", vim.lsp.buf.implementation)
	vim.keymap.set("n", "gd", vim.lsp.buf.type_definition)
	vim.keymap.set("n", "gr", vim.lsp.buf.references)
	vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
	vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>")
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
	vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>")

	vim.keymap.set("n", "<leader>dd", function()
		vim.diagnostic.open_float(0, { scope = "line" })
	end)
	vim.keymap.set("n", "<leader>de", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<leader>di", vim.diagnostic.goto_prev)

	-- use :LspRestart instead
	-- vim.cmd [[ command! RestartLsp lua vim.lsp.stop_client(vim.lsp.get_active_clients()) ]]

	if
		vim.fn.filereadable(vim.fn.expand "$XDG_CACHE_HOME/bin/colemak") == 1
	then
		vim.keymap.set("n", "O", vim.lsp.buf.hover)
	else
		vim.keymap.set("n", "K", vim.lsp.buf.hover)
	end

	-- TODO: convert this to vim.keymap.set
	vim.cmd [[inoremap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"]]
	vim.cmd [[inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"]]
end

local capabilities = cmp_nvim_lsp.update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

lspconfig.tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.clangd.setup {
	cmd = {
		"clangd",
		"--background-index",
		"--suggest-missing-includes",
		"--clang-tidy",
		"--header-insertion=iwyu",
	},
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.pylsp.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.gopls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.vimls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.hls.setup {
	cmd = {
		"haskell-language-server-wrapper",
		"--lsp",
		"--logfile",
		"/home/kesav/.cache/bin/hls.log",
		"--debug",
	},
	filetypes = { "haskell" },
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.terraformls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

local sumneko_root_path = vim.fn.stdpath "cache"
	.. "/lspconfig/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"
-- file must have .lua extension
lspconfig.sumneko_lua.setup {
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
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
	on_attach = on_attach,
	capabilities = capabilities,
}

rusttools.setup {
	tools = { -- rust-tools options
		-- Automatically set inlay hints (type hints)
		autoSetHints = true,

		-- Whether to show hover actions inside the hover window
		-- This overrides the default hover handler
		-- hover_with_actions = true,

		runnables = {
			-- whether to use telescope for selection menu or not
			use_telescope = true,

			-- rest of the opts are forwarded to telescope
		},

		debuggables = {
			-- whether to use telescope for selection menu or not
			use_telescope = true,

			-- rest of the opts are forwarded to telescope
		},

		-- These apply to the default RustSetInlayHints command
		inlay_hints = {

			-- Only show inlay hints for the current line
			only_current_line = false,

			-- Event which triggers a refersh of the inlay hints.
			-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
			-- not that this may cause  higher CPU usage.
			-- This option is only respected when only_current_line and
			-- autoSetHints both are true.
			only_current_line_autocmd = "CursorHold",

			-- wheter to show parameter hints with the inlay hints or not
			show_parameter_hints = true,

			-- prefix for parameter hints
			parameter_hints_prefix = "<- ",

			-- prefix for all the other hints (type, chaining)
			other_hints_prefix = "=> ",

			-- -- whether to align to the length of the longest line in the file
			-- max_len_align = false,
			-- -- padding from the left if max_len_align is true
			-- max_len_align_padding = 1,
			-- -- whether to align to the extreme right or not
			-- right_align = false,
			-- -- padding from the right if right_align is true
			-- right_align_padding = 7,

			-- The color of the hints
			highlight = "Comment",
		},

		hover_actions = {
			-- the border that is used for the hover window
			-- see vim.api.nvim_open_win()
			border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			},

			-- whether the hover action window gets automatically focused
			auto_focus = false,
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	server = {
		-- capabilities = lsp.capabilities,
		-- on_init = lsp.on_init,
		on_attach = on_attach,
		capabilities = capabilities,

		settings = {
			["rust-analyzer"] = {
				assist = {
					importGranularity = "module",
					importPrefix = "by_self",
				},
				cargo = {
					loadOutDirsFromCheck = true,
				},
				procMacro = {
					enable = true,
				},
			},
		},
	},
}
