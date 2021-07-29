vim.g.gruvbox_italic = 1
vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "hard"

local has_gruvbox, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not has_gruvbox then
	print("after/plugin/gruvbox.lua: install gruvbox-community/gruvbox")
	return
end

-- hi GruvboxRedUnderline    guifg=#fb4934 gui=none
-- hi GruvboxYellowUnderline guifg=#fabd2f gui=none
-- hi GruvboxBlueUnderline   guifg=#83a598 gui=none
-- hi GruvboxAquaUnderline   guifg=#8ec07c gui=none

vim.cmd [[hi! link DiffAdd    GruvboxGreen]]
vim.cmd [[hi! link DiffChange GruvboxRed]]
vim.cmd [[hi! link DiffDelete GruvboxRed]]

vim.cmd [[hi! link EndOfBuffer GruvboxBg0]]
