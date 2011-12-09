print("Heart Package Manager")

local command = process.argv[1]
if command == "install" then
  print("TODO: implement install")
  return

else
  print[[
Usage: heart <command>

where <command> is one of:

    bin      heart bin
             heart bin -g
             (just prints the bin folder)

    install

    list

    help
]]
  return
end

