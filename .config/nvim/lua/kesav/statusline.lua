local has_el, el = pcall(require, "el")
if not has_el then
	print "lua/kesav/statusline.lua: install tjdevries/express_line.nvim"
	return
end

local extensions = require "el.extensions"
local subscribe = require "el.subscribe"

local function mode(config)
	return function()
		local m = vim.api.nvim_get_mode().mode
		return config[m]["hi"] .. config[m]["name"]
	end
end

local git_branch = subscribe.buf_autocmd(
	"el_git_branch",
	"BufEnter",
	function(window, buffer)
		local branch = extensions.git_branch(window, buffer)
		if branch then
			return "%#StatusDark#" .. " שׂ " .. branch .. " "
		end
	end
)

local function lsp_diagnostics(buffer, severity)
	local count = vim.lsp.diagnostic.get_count(buffer.bufnr, severity)
	if count > 0 then
		return "%#StatusLsp" .. severity .. "#" .. " " .. count .. " "
	else
		return ""
	end
end

local function lsp_diagnostics_wrapper(_, buffer)
	local clients = vim.lsp.buf_get_clients(buffer.bufnr)
	if #clients > 0 then
		return lsp_diagnostics(buffer, "Error")
			.. lsp_diagnostics(buffer, "Warning")
			.. lsp_diagnostics(buffer, "Information")
			.. lsp_diagnostics(buffer, "Hint")
	else
		return ""
	end
end

local function generator()
	vim.cmd [[ hi StatusModeAqua   guifg=#1d2021 guibg=#689d6a gui=bold ]]
	vim.cmd [[ hi StatusModeBlue   guifg=#1d2021 guibg=#458588 gui=bold ]]
	vim.cmd [[ hi StatusModeYellow guifg=#1d2021 guibg=#d79921 gui=bold ]]
	vim.cmd [[ hi StatusModePink   guifg=#1d2021 guibg=#b16286 gui=bold ]]
	vim.cmd [[ hi StatusModeGreen  guifg=#1d2021 guibg=#98971a gui=bold ]]
	vim.cmd [[ hi StatusModeRed    guifg=#1d2021 guibg=#cc241d gui=bold ]]

	vim.cmd [[ hi StatusLight      guifg=#1d2021 guibg=#a89984 ]]
	vim.cmd [[ hi StatusDark       guifg=#ebdbb2 guibg=#3c3836 ]]
	vim.cmd [[ hi StatusDarker     guifg=#a89984 guibg=#282828 ]]

	vim.cmd [[ hi StatusLspError       guifg=#3c3836 guibg=#fb4934 ]]
	vim.cmd [[ hi StatusLspWarning     guifg=#3c3836 guibg=#fabd2f ]]
	vim.cmd [[ hi StatusLspInformation guifg=#3c3836 guibg=#83a598 ]]
	vim.cmd [[ hi StatusLspHint        guifg=#3c3836 guibg=#8ec07c ]]

	local config = {
		["n"] = { name = " N ", hi = "%#StatusModeAqua#" },
		["v"] = { name = " V ", hi = "%#StatusModeYellow#" },
		["V"] = { name = " V ", hi = "%#StatusModeYellow#" },
		[""] = { name = " V ", hi = "%#StatusModeYellow#" },
		["i"] = { name = " I ", hi = "%#StatusModeBlue#" },
		["ic"] = { name = " I ", hi = "%#StatusModeBlue#" },
		["c"] = { name = " C ", hi = "%#StatusModePink#" },
		["t"] = { name = " T ", hi = "%#StatusModeGreen#" },
	}

	setmetatable(config, {
		__index = function(_, m)
			return { name = " " .. m .. " ", hi = "%#StatusModeRed#" }
		end,
	})

	return {
		mode(config), -- mode
		git_branch, -- git branch
		"%#StatusDarker#" .. " %F", -- file name
		"%=", -- switch sides
		" %m", -- modifiable
		" %r ", -- readable
		"%#StatusDark#" .. " %y ", -- filetype
		"%#StatusLight#" .. " %cC", -- columns
		" %l/%LL ", -- lines
		lsp_diagnostics_wrapper, -- counts of diagnostic messages
	}
end

return el.setup { generator = generator }
