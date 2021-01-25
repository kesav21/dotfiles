local Job = require('plenary.job')

local function os_execute_output(cmd)
	local command = table.remove(cmd, 1)
	return Job:new({ command = command, args = cmd }):sync()
end

local function firstline(filename)
	local file = io.open(filename)
	if file then
		for line in io.lines(filename) do
			io.close(file)
			return line
		end
	end
end


local function tab_highlight(current, tab)
	if current == tab then
		return "%#TabSel#"
	else
		return "%#TabUnsel#"
	end
end

local function buf_normal_title(buf)
	local bufname = vim.api.nvim_buf_get_name(buf)
	if bufname == "" then
		return "[No Name]"
	else
		local filepath  = vim.fn.fnamemodify(bufname, ":.")
		local shortname = vim.fn.pathshorten(filepath)
		return shortname
	end
end

local function buf_terminal_cwd(pid)
	local cwd_output = os_execute_output {
		"readlink",
		"-e",
		string.format("/proc/%s/cwd", pid),
	}
	local cwd = cwd_output[1]

	if cwd == vim.fn.getcwd() then
		return "."
	elseif cwd == os.getenv('HOME') then
		return "~"
	else
		local filepath  = vim.fn.fnamemodify(cwd, ":~:.")
		local shortname = vim.fn.pathshorten(filepath)
		return shortname
	end
end

local function buf_terminal_title(buf)
	local id = vim.api.nvim_buf_get_var(buf, 'terminal_job_id')
	local pid = vim.fn.jobpid(id)
	local shell = firstline(string.format("/proc/%s/cmdline", pid))
	local shortname = buf_terminal_cwd(pid)
	return string.format("[%s] %s", shell, shortname)
end

local function buf_help_title(buf)
	local bufname = vim.api.nvim_buf_get_name(buf)
	local filename = vim.fn.fnamemodify(bufname, ":t")
	return '[h] ' .. filename
end

local function tab_title(tab)
	local win     = vim.api.nvim_tabpage_get_win(tab)
	local buf     = vim.api.nvim_win_get_buf(win)
	local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')

	if buftype == "" then
		return buf_normal_title(buf)
	elseif buftype == 'terminal' then
		return buf_terminal_title(buf)
	elseif buftype == 'help' then
		return buf_help_title(buf)
	else
		return 'TODO: handle ' .. buftype
	end
end

function _G.tabline()
	vim.cmd [[ hi TabSel    guifg=#1d2021 guibg=#a89984 ]]
	vim.cmd [[ hi TabUnsel  guifg=#a89984 guibg=#282828 ]]
	vim.cmd [[ hi TabClear                guibg=#282828 ]]

	local tabs = vim.api.nvim_list_tabpages()
	local current = vim.api.nvim_get_current_tabpage()

	local line = ""
	for _, tab in ipairs(tabs) do
		line = line .. tab_highlight(current, tab) .. " " .. tab_title(tab) .. " "
	end
	return line .. "%#TabClear#"
end

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.tabline()"

