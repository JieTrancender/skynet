local pb = require "protobuf"
pb.register_file "Person.pb"

local skynet = require "skynet"
local protobuf = require "protobuf"

skynet.start(function()
	protobuf.register_file "Person.pb"
	skynet.error("注册协议文件：Person.pb")
	stringbuffer = protobuf.encode("cs.Person", {
		name = "jason",
		id = 1,
	})

	local data = protobuf.decode("cs.Person", stringbuffer)
	skynet.error("数据编码：name = "..data.name..", id = "..data.id)
end)