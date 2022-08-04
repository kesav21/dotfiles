hs.console.clearConsole()
hs.console.darkMode(true)

-- open terminal
hs.hotkey.bind({ "cmd", "shift" }, "Return", function()
	hs.execute "open -na Alacritty"
end)

hs.hotkey.bind({ "cmd", "shift" }, "Delete", function()
	hs.window.focusedWindow():close()
end)

local function find(list, value)
	for k, v in ipairs(list) do
		if v == value then
			return k
		end
	end
	return nil
end

-- focus window to the left
hs.hotkey.bind({ "cmd" }, "i", function()
	hs.window.focusedWindow():focusWindowWest()
end)

-- focus window to the left
hs.hotkey.bind({ "cmd" }, "e", function()
	hs.window.focusedWindow():focusWindowEast()
end)

-- move window to left half of screen
hs.hotkey.bind({ "cmd", "shift" }, "i", function()
	local window = hs.window.focusedWindow()
	local frame = window:frame()
	local max = window:screen():frame()
	frame.x = max.x
	frame.y = max.y
	frame.w = max.w / 2
	frame.h = max.h
	window:setFrame(frame)
end)

-- move window to right half of screen
hs.hotkey.bind({ "cmd", "shift" }, "e", function()
	local window = hs.window.focusedWindow()
	local frame = window:frame()
	local max = window:screen():frame()
	frame.x = max.x + (max.w / 2)
	frame.y = max.y
	frame.w = max.w / 2
	frame.h = max.h
	window:setFrame(frame)
end)

-- maximize window
hs.hotkey.bind({ "cmd" }, "/", function()
	hs.window.focusedWindow():maximize()
end)

-- fullscreen window
hs.hotkey.bind({ "cmd", "shift" }, "/", function()
	hs.window.focusedWindow():toggleFullScreen()
end)

local function resize(v)
	return function()
		local window = hs.window.focusedWindow()
		local frame = window:frame()
		if frame.x == 0 then
			frame.w = frame.w - v
		else
			frame.x = frame.x - v
			frame.w = frame.w + v
		end
		window:setFrame(frame)
	end
end
-- coarsely resize node to the left
-- hs.hotkey.bind({ "cmd" }, "n", resize(10), nil, resize(10))
-- coarsely resize node to the right
-- hs.hotkey.bind({ "cmd" }, "o", resize(-10), nil, resize(-10))
-- resize node to the left
hs.hotkey.bind({ "cmd", "shift" }, "n", resize(10), nil, resize(1))
-- resize node to the right
hs.hotkey.bind({ "cmd", "shift" }, "o", resize(-10), nil, resize(-1))

hs.loadSpoon "ReloadConfiguration"
spoon.ReloadConfiguration:start()
