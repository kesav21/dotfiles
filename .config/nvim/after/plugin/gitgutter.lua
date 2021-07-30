if vim.fn.exists(":GitGutterSignsDisable") ~= 2 then
	print("after/plugin/gitgutter.lua: install airblade/vim-gitgutter")
	return
end

vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 0

vim.cmd [[command! Hunks GitGutterQuickFix | copen]]
vim.cmd [[cnoreabbrev hunks Hunks]]

vim.cmd [[GitGutterSignsDisable]]
