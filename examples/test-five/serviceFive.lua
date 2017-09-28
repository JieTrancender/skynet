local common = require "common"
local skynet = require "skynet"
require "skynet.manager"

local CMD = {}
local client_fd
local host

function CMD.start(conf)
	print("service five cmd:start")
end

function CMD.disconnect()
	skynet.exit()
end

skynet.start(function()
	print("service start...")
	skynet.dispatch("lua", function(session, address, cmd, ...)
		print("service dispatch")
		local f = CMD[cmd]
		skynet.ret(skynet.pack(f(...)))
	end)
end)

