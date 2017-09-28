local skynet = require "skynet"

skynet.start(function()
	print("skynet server start......")

	--local serviceOne = skynet.newservice("serviceOne")
	--kynet.call(serviceOne, "lua", "set", "keyOne", "value-one")
	--local value = skynet.call(serviceOne, "lua", "get", "keyOne")
	--print("value = ", value)
	skynet.newservice("socketThree")

	skynet.exit()
end)

