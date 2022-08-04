local obj = {}
obj.__index = obj

obj.name = "ReloadConfiguration"
obj.version = "1.0"
obj.author = "Jon Lorusso <jonlorusso@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.watch_paths = { hs.configdir }

function obj:bindHotkeys(mapping)
	local def = { reloadConfiguration = hs.fnutils.partial(hs.reload, self) }
	hs.spoons.bindHotkeysToSpec(def, mapping)
end

function obj:start()
	self.watchers = {}
	for _, dir in pairs(self.watch_paths) do
		self.watchers[dir] = hs.pathwatcher.new(dir, hs.reload):start()
	end
	return self
end

return obj
