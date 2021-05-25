-- Shamelessly copied from TJ 'xdg_config/nvim/lua/tj/globals/init.lua'

-- Pritty print given value
P = function(v)
  print(vim.inspect(v))
  return v
end

-- Required plenary
-- RELOAD = Reload given lua package
-- R = Reload given lua package and return require
-- 
-- Can be handy within mappings for fast development:
--   
if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

-- `vim.opt`
require('jvg.globals.opt')
