local Path = require('path')
local UV = require('uv')
local FS = require('fs')

local Utils = {}

function Utils.mkdir_p(path)
  -- TODO: Implement fully with a loop
  print("mkdir -p " .. path)
  if not FS.exists_sync(path) then
    FS.mkdir_sync(path, "0775")
  end
end

function Utils.rm_rf(path)
  -- TODO: Implement fully with a loop
  print("rm -rf " .. path)
  if FS.exists_sync(path) then
    FS.unlink_sync(path)
  end
end

function Utils.ln_s(target, file)
  print("ln -s " .. target .. " " .. file)
  FS.symlink_sync(target, file)
end

local lazy = {
  prefix = function ()
    return Path.dirname(Utils.global_bin)
  end,
  cwd = function ()
    return process.cwd()
  end,
  global_bin = function ()
    return Path.dirname(UV.execpath())
  end,
  global_modules = function ()
    return Path.join(Utils.prefix, "lib/luvit/modules")
  end,
  local_bin = function ()
    return Path.join(Utils.local_modules, ".bin")
  end,
  local_modules = function ()
    return Path.join(Utils.cwd, "modules")
  end
}
setmetatable(Utils, {
  __index = function (table, key)
    local value = lazy[key]()
    rawset(table, key, value)
    return value
  end
})
return Utils
