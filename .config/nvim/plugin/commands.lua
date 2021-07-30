_G.kesav = {}

vim.cmd [[command Bd bp|bd#]]
vim.cmd [[cnoreabbrev bd Bd]]

vim.cmd [[cnoreabbrev tsp TSP]]

function _G.kesav.newfile()
	vim.api.nvim_feedkeys(
		string.format(
			":edit %s/",
			vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h")
		),
		"n",
		true
	)
end
vim.cmd [[cnoreabbrev newf lua kesav.newfile()]]

function _G.kesav.copyfile()
	vim.cmd [[silent !xsel -ib < %]]
end
vim.cmd [[cnoreabbrev copyf lua kesav.copyfile()]]

function _G.kesav.runfile()
	vim.cmd [[!%:p]]
end
vim.cmd [[cnoreabbrev runf lua kesav.runfile()]]

function _G.kesav.togglecolumns()
	if vim.wo.colorcolumn == "" then
		vim.wo.colorcolumn = "88"
	else
		vim.wo.colorcolumn = ""
	end
end
vim.cmd [[cnoreabbrev cols lua kesav.togglecolumns()]]
