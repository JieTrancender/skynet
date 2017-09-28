local skynet = require "skynet"
require "skynet.manager"
local socket = require "skynet.socket"

local function acceptOne(id)
	socket.start(id)
	socket.write(id, "Hello Skynet\n")
	skynet.newservice("agentOne", id)

	-- some data on this connection(id) may lost
	socket.abandon(id)
end

local function acceptTwo(id)
	socket.start(id)
	local agentTwo = skynet.newservice("agentTwo")
	skynet.call(agentTwo, "lua", id)

	-- abandon仅仅是清除在本服务内的数据结构，但并不关闭这个socket
	socket.abandon(id)
end

skynet.start(function()
	print("socket start...")

	local id = socket.listen("127.0.0.1", 8888)
	print("listen socket: ", "127.0.0.1", 8888)

	socket.start(id, function(id, addr)
		print("connect from " .. addr .. " " .. id)

		-- 处理接收到的消息，交给agentOne or agentTwo
		acceptTwo(id)
	end)

	skynet.register "socketThree"
end)