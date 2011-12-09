local Utils = require('./utils')
local Path = require('path')
local FS = require('fs')

local module_name = process.argv[2]

if module_name then
  Utils.mkdir_p(Utils.local_modules)
  local target = Path.join(Utils.global_modules, module_name)
  local file = Path.join(Utils.local_modules, module_name)
  Utils.rm_rf(file)
  Utils.ln_s(target, file)
else
  -- Insert link to current module in global modules folder
  local metadata = require(Path.join(Utils.cwd, "package.lua"))
  module_name = metadata.name
  local target = Path.join(Utils.cwd)
  local file = Path.join(Utils.global_modules, module_name)
  Utils.mkdir_p(Utils.global_modules)
  Utils.rm_rf(file)
  Utils.ln_s(target, file)
end

