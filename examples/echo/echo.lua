local skynet = require "skynet"
require "skynet.manager"

local command = {}

function command.HELLO(msg)
	return "i am echo server, get this:" .. msg
end

function dispatcher()
	skynet.dispatch("lua", function(session, address, cmd, ...)
		cmd = cmd:upper()
		if cmd == "HELLO" then
			local f = command[cmd]
			assert(f)
			skynet.ret(skynet.pack(f(...)))
		end
	end)
	skynet.register("echo")
end

skynet.start(dispatcher)