local snax = require "snax"



-- 登陆服现在有的service: mysqld,mongod,logind,
local mongo_ip = skynet.getenv("mongo_ip")
local mongo_user = skynet.getenv("mongo_user")
local mongo_passwd = skynet.getenv("mongo_passwd")
local mongo_db = skynet.getenv("mongo_db")
local mysql_ip = skynet.getenv("mysql_ip")
local mysql_user = skynet.getenv("mysql_user")
local mysql_passwd = skynet.getenv("mysql_passwd")
local mysql_db = skynet.getenv("mysql_db")
local mongo_port = skynet.getenv("mongo_port")
local client_ip = skynet.getenv("client_ip")
local client_port = skynet.getenv("client_port")
local web_ip = skynet.getenv("web_ip")
local web_port = skynet.getenv("web_port")
local server_ip = skynet.getenv("server_ip")
local server_port = skynet.getenv("server_port")
-- local gm_ip = skynet.getenv("gm_ip")
-- local gm_port = skynet.getenv("gm_port")
-- local http_ip = skynet.getenv("http_ip")
-- local http_port = skynet.getenv("http_port")

skynet.start(function()
	-- g_configMgr:loadAll()

	local mysqld = snax.uniqueservice("mysqld", mysql_ip, mysql_db, mysql_user, mysql_passwd)
	)