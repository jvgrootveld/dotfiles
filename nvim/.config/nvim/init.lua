--            _
--           (_)_   __ ____ _
--          / /| | / // __ `/  Justin van Grootveld 
--         / / | |/ // /_/ /   https://github.com/jvgrootveld
--      __/ /  |___/ \__, /
--     /___/        /____/
--

--[[ Notes about this config

./lua/plugin/*.lua
  Loaded automatically with 'tjdevries/astronauta.nvim'

./plugin/*.vim
./after/plugin/*.vim
 Some plugin configuration not ported to lua

./lua/jvg/*.lua
 Personal confugration, options and mapping.
 Sourced manually with:

   require('jvg.name')

--]]
vim.g.mapleader = " "

-- Setup globals that I expect to be always available.
--  See `./lua/jvg/globals/*.lua` for more information.
require("jvg.globals")

-- Load packer.nvim files
require("jvg.plugins")

-- Force loading of astronauta first.
vim.cmd [[runtime plugin/astronauta.vim]]

-- Load neovim options
require('jvg.options')

-- Load personal plugin config
require("jvg.telescope")
require("jvg.treesitter")
require("jvg.lsp_lua")
require("jvg.neoterm")

require("telescope").load_extension("simple_insert")
require("telescope").load_extension("zoxide")

vim.api.nvim_set_keymap(
	'n',
	'<leader>i',
	":lua R'telescope'.extensions.simple_insert.select{}<CR>",
	{noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>cd",
	":lua require'telescope'.extensions.zoxide.list{}<CR>",
	{noremap = true, silent = true}
)
