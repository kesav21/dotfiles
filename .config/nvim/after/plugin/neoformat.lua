vim.g.neoformat_enabled_python = { "black" }

vim.g.neoformat_enabled_sh = { "shfmt" }
vim.g.neoformat_sh_shfmt = {
	exe = "shfmt",
	args = { "-p", "-i 0", "-ci" },
}

vim.g.neoformat_enabled_zsh = { "shfmt" }
vim.g.neoformat_zsh_shfmt = {
	exe = "shfmt",
	args = { "-p", "-i 0", "-ci" },
}

vim.g.neoformat_enabled_haskell = { "brittany" }

vim.g.neoformat_enabled_typescript = { "prettier" }
vim.g.neoformat_enabled_javascript = { "prettier" }

vim.g.neoformat_enabled_go = { "gofmt" }
vim.g.neoformat_go_gofmt = {
	exe = "gofmt",
	args = { "-s" },
}

vim.g.neoformat_enabled_java = { "astyle" }
vim.g.neoformat_java_astyle = {
	exe = "astyle",
	args = { "--indent=tab", "<" },
}

-- vim.g.neoformat_enabled_c = { "astyle" }
-- vim.g.neoformat_c_astyle = {
-- 	exe = "astyle",
-- 	args = {
-- 		"--style=attach",
-- 		"--indent=force-tab",
-- 		"--attach-namespaces",
-- 		"--attach-classes",
-- 		"--attach-inlines",
-- 		"--attach-extern-c",
-- 		"--attach-closing-while",
-- 		"--indent-classes",
-- 		"--indent-switches",
-- 		"--indent-namespaces",
-- 		"--pad-oper",
-- 		"--pad-comma",
-- 		"--pad-header",
-- 		"--unpad-paren",
-- 		"--align-pointer=type",
-- 		"--break-one-line-headers",
-- 		"--add-braces",
-- 		"--max-code-length=80",
-- 		"<"
-- 	},
-- }

vim.g.neoformat_enabled_c = {}
vim.g.neoformat_enabled_cpp = {}

vim.g.neoformat_enabled_markdown = {}
-- vim.g.neoformat_enabled_markdown = { "prettier" }
-- vim.g.neoformat_markdown_prettier = {
-- 	exe = "prettier",
-- 	args = { "--prose-wrap", "never" },
-- 	}
