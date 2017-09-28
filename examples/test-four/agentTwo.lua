local skynet = require "skynet"
local socket = require "skynet.socket"

local proto = require "proto"
local sproto = require "sproto"

local host

local REQUEST = {}

function REQUEST:say()
	print("say", self.name, self.msg)
end

function REQUEST:handshake()
	print("handshake")
end

function REQUEST:quit()
	print("quit")
end

local function request(name, args, response)
	local f = assert(REQUEST[name])
	local r = f(args)
	if response then
		--
	end
end

local function echo(id)
	socket.start(id)

	host = sproto.new(proto.c2s):host "package"

	while true do
		local str = socket.read(id)
		if str then
			local type, str2, str3, str4 = host:dispatch(str)

			if type == "REQUEST" then
				local ok, result = pcall(request, str2, str3, str4)
			end
		else
			socket.close(id)
			return
		end
	end
end

skynet.start(function()
	skynet.dispatch("lua", function(session, address, fd, ...)
		skynet.fork(function()
			echo(fd)
			skynet.exit()
		end)
	end)
end)
