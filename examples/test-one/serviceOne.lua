local skynet = require "skynet"
require "skynet.manager"

local db = {}

local command = {
	get = function(key)
		print("command:get")
		return db[key]
	end,
	set = function(key, value)
		print("command:set:key = "..key..", value = "..value)
		db[key] = value
		local last = db[key]
		return last
	end
}

skynet.start(function()
	print("serviceOne start...")

	skynet.dispatch("lua", function(session, address, cmd, ...)
		print("serviceOne dispatch...")

		local f = command[cmd]
		if f then
			-- skynet.pack:用默认的lua类型打包一个消息，返回可供内部调用的指针和长度
			-- skynet.ret:将打包好的消息回应给当前任务的请求源头
			skynet.ret(skynet.pack(f(...)))
		else
			error(string.format("unknown command %s", tostring(cmd)))
		end
	end)

	skynet.register "SERVICEONE"
end)