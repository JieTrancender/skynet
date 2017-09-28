local skynet = require "skynet"
local gateserver = require "snax.gateserver"
local netpack = require "netpack"
local common = require "common"

local connection = {}
local handler = {}

local agentlist = {}

function handler.message(fd, msg, sz)
	print("gate handler:message " .. fd)

	local conn = connection[fd]
	local agent = agentlist[fd]

	if agent then
		print("接收到客户端消息，传给agent服务处理")
	else
		print("没有agent处理消息")
	end
end

function handler.connect(fd, addr)
	print("gate handler:connect")

	local c = {
		fd = fd,
		ip = addr,
	}

	connection[fd] = c

	gateserver.openclient(fd)

	agentlist[fd] = skynet.newservice("serviceFive")
	skynet.call(agentlist[fd], "lua", "start", { fd = fd, addr = addr})
end

function handler.disconnect(fd)
	print(fd .. " 断开连接")
end

function handler.error(fd, msg)
	print("异常错误")
end

gateserver.start(handler)



