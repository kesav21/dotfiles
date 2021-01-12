local extensions = require('el.extensions')
local subscribe = require('el.subscribe')

local function mode(config)
	return function()
		local m = vim.api.nvim_get_mode().mode
		return config[m]["hi"] .. config[m]["name"]
	end
end

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
	local branch = extensions.git_branch(window, buffer)
	if branch then
		return "%#StatusDark#" ..  " שׂ " .. branch .. " "
	end
end)

local function generator()
	vim.cmd [[ hi StatusModeCyan   guifg=#1d2021 guibg=#689d6a gui=bold ]]
	vim.cmd [[ hi StatusModeBlue   guifg=#1d2021 guibg=#458588 gui=bold ]]
	vim.cmd [[ hi StatusModeYellow guifg=#1d2021 guibg=#d79921 gui=bold ]]
	vim.cmd [[ hi StatusModePink   guifg=#1d2021 guibg=#b16286 gui=bold ]]
	vim.cmd [[ hi StatusModeRed    guifg=#1d2021 guibg=#cc241d gui=bold ]]
	vim.cmd [[ hi StatusLight      guifg=#1d2021 guibg=#a89984 ]]
	vim.cmd [[ hi StatusDark       guifg=#ebdbb2 guibg=#3c3836 ]]
	vim.cmd [[ hi StatusDarker     guifg=#a89984 guibg=#282828 ]]

	local config = {
		["n"]  = {name = " N ", hi = "%#StatusModeCyan#"},
		["v"]  = {name = " V ", hi = "%#StatusModeYellow#"},
		["V"]  = {name = " V ", hi = "%#StatusModeYellow#"},
		[""] = {name = " V ", hi = "%#StatusModeYellow#"},
		["i"]  = {name = " I ", hi = "%#StatusModeBlue#"},
		["ic"] = {name = " I ", hi = "%#StatusModeBlue#"},
		["c"]  = {name = " C ", hi = "%#StatusModePink#"},
	}

	setmetatable(config, {
		__index = function(_, m)
			return {name = " " .. m .. " ", hi = "%#StatusModeRed#"}
		end
	})

	return {
		mode(config),               -- mode
		git_branch,                 -- git branch
		'%#StatusDarker#' .. ' %F', -- file name
		'%=',                       -- switch sides
		" %m",                      -- modifiable
		" %r ",                     -- readable
		"%#StatusDark#" .. " %y ",  -- filetype
		"%#StatusLight#" .. " %cC", -- columns
		" %l/%LL ",                 -- lines
	}
end

return require('el').setup { generator = generator }
