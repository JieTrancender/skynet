local skynet = require "skynet"

skynet.start(function()
	print("skynet start...")

	skynet.newservice("socketTwo")

	skynet.exit()
end)
