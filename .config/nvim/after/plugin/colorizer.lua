if os.getenv "TERM" == "linux" then
	return
end

local ok, colorizer = pcall(require, "colorizer")
if not ok then
	print "after/plugin/colorizer.lua: install norcalli/nvim-colorizer.lua"
	return
end

colorizer.setup()
