package.cpath = "luaclib/?.so"
package.path = "lualib/?.lua;example/test/?.lua"

if _VERSION ~= "Lua 5.3" then
	error "please use lua 5.3"
end

local socket = require "client.socket"

-- 通信协议
local proto = require "proto"
local sproto = require "sproto"

local host = sproto.new(proto.s2c):host "package"
local request = host:attach(sproto.new(proto.c2s))

local fd = assert(socket.connect("127.0.0.1", 8888))

local session = 0
local function send_request(name, args)
	session = session + 1
	local str = request(name, args, session)

	socket.send(fd, str)

	print("request", session)
end

send_request("handshake")
send_request("say", { name = "soul", msg = "hello world"})

while true do
	local str = socket.recv(fd)

	if str ~= nil and str ~= "" then
		print("server msg:"..str)
	end

	local readstr = socket.readstdin()
	if readstr then
		if readstr == "quit" then
			send_request("quit")
			socket.close(fd)
			break
		else
			send_request("say", { name = "soul", msg = readstr})
		end
	else
		socket.usleep(100)
	end
end


local fd = assert(socket.connect("127.0.0.1", 8888))

socket.send(fd, "Hello World!")
while true do
	local str = socket.recv(fd)
	if str ~= nil and str ~= "" then
		print("server msgs: "..str)
	end

	local readStr = socket.readstdin()
	if readStr then
		if readStr == "quit" then
			socket.close(fd)
			break;
		else
			socket.send(fd, readStr)
		end
	else
		socket.usleep(100)
	end
end
