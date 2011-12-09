local Path = require('path')
local UV = require('uv')
local FS = require('fs')
local bin_folder = Path.dirname(UV.execpath())
local lib_folder = Path.join(bin_folder, "../lib/luvit/modules")
local module = process.cwd()
p({bin=bin_folder,module=module})

local module_name = process.argv[2]

if not module_name then
  -- Insert link to current module in global modules folder
  local metadata = require(Path.join(module, "package.lua"))
  print ("ln -s", module, Path.join(lib_folder, metadata.name))
  FS.symlink_sync(module, Path.join(lib_folder, metadata.name))
else
  local target_dir = Path.join(module, "modules")
  if not FS.exists_sync(target_dir) then
    FS.mkdir_sync(target_dir, "0775")
  end
  -- TODO: clear out existing module here
  print ("ln -s", Path.join(lib_folder, module_name), Path.join(target_dir, module_name))
  FS.symlink_sync(Path.join(lib_folder, module_name), Path.join(target_dir, module_name))
end

