--            _
--           (_)_   __ ____ _
--          / /| | / // __ `/  Justin van Grootveld 
--         / / | |/ // /_/ /   https://github.com/jvgrootveld
--      __/ /  |___/ \__, /
--     /___/        /____/
--

--[[ Notes about this config
./lua/config/*.lua
  Plugin configuration. Loaded with packer config:

    config = [[require("jvg/config/telescope-zoxide") \[\]

./lua/jvg/*.lua
 Personal confugration, options and mapping.
 Sourced manually with:

   require('jvg.name')

./plugin/*.vim
./after/plugin/*.vim
  Some plugin configuration not ported to lua

./lua/plugin/*.lua
  Loaded manually in init.lua (should be automatically?)

--]]
vim.g.mapleader = " "

-- Setup globals that I expect to be always available.
--  See `./lua/jvg/globals/*.lua` for more information.
require("jvg.globals")

-- Load packer.nvim files
require("jvg.plugins")

-- Load plugins specifics
require("plugin.keymaps")
require("plugin.netrw")
require("plugin.vim-go")

-- Load neovim options
require('jvg.options')

