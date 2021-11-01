-- Config for telescope-zoxide
-- See: https://github.com/jvgrootveld/telescope-zoxide

-- Setup
local z_utils = require("telescope._extensions.zoxide.utils")
local builtin = require("telescope.builtin")

require("telescope._extensions.zoxide.config").setup({
  mappings = {
    default = {
      after_action = function(selection)
        print("Update to (" .. selection.z_score .. ") " .. selection.path)
      end
    }
  }
})

-- Keymappings
vim.api.nvim_set_keymap(
	"n",
	"<leader>cd",
	":lua require'telescope'.extensions.zoxide.list{}<CR>",
	{noremap = true, silent = true}
)
