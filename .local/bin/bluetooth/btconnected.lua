#!/bin/luajit

local uv = require("luv")

local function await(fn)
	local return_value
	local this = coroutine.running()
	local function on_exit(data)
		return_value = data
		coroutine.resume(this)
	end
	coroutine.wrap(fn)(on_exit)
	coroutine.yield()
	return return_value
end

local function execute(cmd)
	return function(resolve)
		local path = cmd[1]
		table.remove(cmd, 1)
		local args = cmd
		--
		local output = uv.new_pipe()
		local process, _ = uv.spawn(path, {
			args = args,
			stdio = { nil, output, nil },
		}, nil)
		--
		local t = {}
		output:read_start(function(err, data)
			if err ~= nil then
				error(err)
			elseif data == nil then
				output:close()
				process:kill("sigterm")
				process:close()
				resolve(t)
			else
				table.insert(t, data)
			end
		end)
	end
end

local function words(message)
	local t = {}
	for s in string.gmatch(message, "[^%s]+") do
		table.insert(t, s)
	end
	return t
end

local function map_values(transform, t)
	local t2 = {}
	for _, v in ipairs(t) do
		table.insert(t2, transform(v))
	end
	return t2
end

local function filter_values(select, t)
	local t2 = {}
	for _, v in ipairs(t) do
		if select(v) then
			table.insert(t2, v)
		end
	end
	return t2
end

local function parse_device(line)
	local ws = words(line)
	table.remove(ws, 1)
	return {
		id = table.remove(ws, 1),
		name = table.concat(ws, " ")
	}
end

local function is_connected(device)
	-- local lines = await(execute { "/usr/bin/bluetoothctl", "info", device.id })
	-- local devinfo = table.concat(lines, "")
	-- return string.find(devinfo, "Connected: yes") ~= nil
	return true
end

local function main()
	local devices = filter_values(
		is_connected,
		map_values(
			parse_device,
			await(execute { "/usr/bin/bluetoothctl", "paired-devices" })
		)
	)
	for _, device in ipairs(devices) do
		print(device.id, device.name)
	end
end

-- coroutine.wrap(main)()
-- uv.run()

-- local function kk()
-- 	local result
-- 	local function resolve(return_value)
-- 		result = return_value
-- 	end
-- 	coroutine.wrap(function(_resolve)
-- 		local timer = uv.new_timer()
-- 		timer:start(1000, 0, function()
-- 			timer:close()
-- 			_resolve("guh")
-- 		end)
-- 	end)(resolve)
-- 	return result
-- end

-- print(kk())
-- uv.run()

-- local function permgen(a, n)
-- 	if n == 0 then
-- 		coroutine.yield(a)
-- 		-- uv.new_timer():start(1000, 0, function()
-- 		-- 	coroutine.yield(a)
-- 		-- end)
-- 	else
-- 		for i=1,n do
-- 			a[n], a[i] = a[i], a[n]
-- 			permgen(a, n - 1)
-- 			a[n], a[i] = a[i], a[n]
-- 		end
-- 	end
-- end

-- local function perm(a)
-- 	local n = #a
-- 	return coroutine.wrap(function() permgen(a, n) end)
-- end

-- for p in perm { "a", "b", "c" } do
-- 	print(table.concat(p, " "))
-- end
-- uv.run()

-- local async
-- async = uv.new_async(function(_resolve)
-- 	async:close()
-- 	_resolve("guh")
-- end)

-- local result
-- local function resolve(return_value)
-- 	result = return_value
-- end
-- async:send(resolve)

-- print(result)

-- uv.run()
