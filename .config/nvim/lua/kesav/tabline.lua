
local function gethighlight(tab, current)
	if tab == current then
		return "%#TabSel#"
	else
		return "%#TabUnsel#"
	end
end

local function getname(tab)
	local win       = vim.api.nvim_tabpage_get_win(tab)
	local buf       = vim.api.nvim_win_get_buf(win)
	local fullname  = vim.api.nvim_buf_get_name(buf)
	local name      = vim.fn.fnamemodify(fullname, ":.")
	local shortname = vim.fn.pathshorten(name)
	return shortname
end

function _G.tabline()
	vim.cmd [[ hi TabSel    guifg=#1d2021 guibg=#a89984 ]]
	vim.cmd [[ hi TabUnsel  guifg=#a89984 guibg=#282828 ]]
	vim.cmd [[ hi TabClear                guibg=#282828 ]]

	local tabs = vim.api.nvim_list_tabpages()
	local current = vim.api.nvim_get_current_tabpage()

	local line = ""
	for _, tab in ipairs(tabs) do
		line = line .. gethighlight(tab, current) .. " " .. getname(tab) .. " "
	end
	return line .. "%#TabClear#"
end

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.tabline()"

