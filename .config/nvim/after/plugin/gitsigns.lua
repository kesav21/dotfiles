local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
	print "after/plugin/gitsigns.lua: install lewis6991/gitsigns.nvim"
	return
end

gitsigns.setup {
	signs = {
		add = { text = "+", hl = "GitAdd", numhl = "GitAddNr" },
		change = { text = "~", hl = "GitChange", numhl = "GitChangeNr" },
		delete = { text = "⌄", hl = "GitDelete", numhl = "GitDeleteNr" },
		topdelete = { text = "^", hl = "GitDelete", numhl = "GitDeleteNr" },
		changedelete = { text = "~", hl = "GitDelete", numhl = "GitDeleteNr" },
	},
	numhl = true,
}

vim.cmd [[cnoreabbrev nh Gitsigns next_hunk]]
vim.cmd [[cnoreabbrev ph Gitsigns prev_hunk]]
vim.cmd [[cnoreabbrev stage Gitsigns stage_hunk]]
vim.cmd [[cnoreabbrev unstage Gitsigns undo_stage_hunk]]
vim.cmd [[cnoreabbrev reset Gitsigns reset_hunk]]
vim.cmd [[cnoreabbrev preview Gitsigns preview_hunk]]
