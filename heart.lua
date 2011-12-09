
local command = process.argv[1]
if command == "install" then return require('./install.lua')
elseif command == "bin" then return require('./bin.lua')
elseif command == "link" then return require('./link.lua')
elseif command == "ls" then return require('./ls.lua')
elseif command == "-v" or command == "version" then print(require('./package').version)
else return require('./usage.lua') end


