DEBUG = true
project_name = "login"
thread = 2
logservice = "mylogger"
--logger = "./log/login"
logger = nil
harbor = 0
start = "main"
bootstrap = "snlua bootstrap"
luaservice = "./service/?.lua;./"..project_name.."/?.lua"
lualoader = "lualib/loader.lua"
cpath = "./cservice/?.so"
lua_path = "./lualib/?.lua;./lualib/?/init.lua;./"..project_name.."/?.lua;"
snax = "./service/?.lua"
--debug_console = 6111
client_passwd = "0~p%e#r"
code_version = "1.0.0.0"

server_id = 4  -- 游戏服id
--daemon = "./skynet.pid"

--数据库
mongo_ip = "127.0.0.1"
mongo_user = "root"
mongo_passwd = "123456"
mongo_db = "pkm_"..server_id


mysql_ip = "127.0.0.1"
mysql_user = "root"
mysql_passwd = "root"
mysql_db = "pkm_log_"..server_id

--监听客户端的ip,port
client_ip = "0.0.0.0"
client_port = "31"..(server_id - 1).."11"

--监听web端的ip,port
web_ip = "0.0.0.0"
web_port = "31"..(server_id - 1).."12"

--监听游戏服的ip,port
server_ip = "0.0.0.0"
server_port = "31"..(server_id-1).."10"