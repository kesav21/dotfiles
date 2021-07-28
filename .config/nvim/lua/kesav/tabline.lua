local has_iter, iter = pcall(require, "kk.iter")
if not has_iter then
	print("lua/kesav/tabline.lua: install kesav21/lua-stdlib")
	return
end

local function choose(first, second, condition)
	if condition then
		return first
	else
		return second
	end
end

local function is_equal(a)
	return function(b)
		return a == b
	end
end

local function buf_islisted(b)
	return vim.fn.buflisted(b) == 1
end

local function buf_current_position(bufs)
	return iter.first(
		iter.filter_keys(
			is_equal(vim.api.nvim_get_current_buf()),
			iter.to_table(bufs)
		)
	)
end

local function buf_title()
	local bufs = vim.api.nvim_list_bufs()
	local listed_bufs = iter.filter(buf_islisted, iter.values(bufs))
	return string.format(
		"[%s/%s]",
		buf_current_position(listed_bufs) or " ",
		iter.length(listed_bufs)
	)
end

-- TODO: fix
-- when a single regular window and two telescope windows are visible,
-- the count shows five windows
local function tab_title(current_tabnr, tabnr)
	local wins = vim.api.nvim_tabpage_list_wins(tabnr)
	local highlight = choose("%#TabSel#", "%#TabUnsel#", current_tabnr == tabnr)
	local current_winnr = vim.api.nvim_tabpage_get_win(tabnr)
	local current_win = iter.first(iter.filter_keys(is_equal(current_winnr), wins))
	return string.format(
		"%s %s: [%s/%s]",
		highlight,
		tabnr,
		current_win,
		#wins
	)
end

local function get_tab_title()
	local current_tabnr = vim.api.nvim_get_current_tabpage()
	local tabs = vim.api.nvim_list_tabpages()
	local t = {}
	for _, tabnr in ipairs(tabs) do
		table.insert(t, tab_title(current_tabnr, tabnr))
	end
	return table.concat(t, " ")
end

function _G.tabline()
	vim.cmd [[ hi TabSel    guifg=#1d2021 guibg=#a89984 ]]
	vim.cmd [[ hi TabUnsel  guifg=#a89984 guibg=#282828 ]]
	vim.cmd [[ hi TabClear                guibg=#282828 ]]

	return string.format(
		"%%#TabUnsel# %s %s %%#TabClear#",
		buf_title(),
		get_tab_title()
	)
end

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.tabline()"

