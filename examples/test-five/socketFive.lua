local skynet = require "skynet"
-- local common = require "common"

local gateOne

skynet.start(function()
	print("socket five start...")
	print("listen socket :", "127.0.0.1", 8888)

	local conf = {
		address = "127.0.0.1",
		port = 8888,
		maxclient = 1024,
		nodelay = true,
	}

	gateOne = skynet.newservice("gate")

	skynet.call(gate, "lua", "open", conf)

end)