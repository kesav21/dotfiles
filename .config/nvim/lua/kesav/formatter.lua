local M = {}

local formatter = require('formatter')

local config = {
	python = {
		exe = "black",
		args = {},
		stdin = false,
	},
	sh = {
		exe = "shfmt",
		args = { "-p", "-i 0", "-ci" },
		stdin = true,
	},
	zsh = {
		exe = "shfmt",
		args = { "-p", "-i 0", "-ci" },
		stdin = true,
	},
	haskell = {
		exe = "brittany",
		args = {},
		stdin = false,
	},
	javascript = {
		exe = "prettier",
		args = {},
		stdin = false,
	},
	typescript = {
		exe = "prettier",
		args = {},
		stdin = false,
	},
	go = {
		exe = "gofmt",
		args = { "-s" },
		stdin = false,
	},
	java = {
		exe = "astyle",
		args = { "--indent=tab", "<" },
		stdin = false,
	},
	-- c = {
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
	-- 	stdin = false,
	-- },
	-- markdown = {
	-- 	exe = "prettier",
	-- 	args = { "--prose-wrap", "never" },
	-- 	stdin = false,
	-- },
}

function M.get_config()
	return config
end

function M.get_formatter()
	for key, value in pairs(config) do
		if vim.bo.filetype == key then
			print(vim.inspect(value))
			return
		end
	end
	print("no formatter for filetype " .. vim.bo.filetype)
end

function M.setup()
	local t = {}
	for key, value in pairs(config) do
		t[key] = { function() return value end }
	end
	formatter.setup {
		logging = false,
		filetype = t,
	}
end

function M.format()
	for key, _ in pairs(config) do
		if vim.bo.filetype == key then
			vim.cmd [[FormatWrite]]
			return
		end
	end
end

return M