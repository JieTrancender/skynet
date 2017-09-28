package.cpath = "luaclib/?.so"
package.path = "lualib/?.lua;example/test/?.lua"

if _VERSION ~= "Lua 5.3" then
	error "please use lua 5.3"
end

local socket = require "client.socket"
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
