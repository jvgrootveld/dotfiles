-- Config for telescope-zoxide
-- See: https://github.com/jvgrootveld/telescope-zoxide

-- Setup
local t = require("telescope")
local z_utils = require("telescope._extensions.zoxide.utils")
local builtin = require("telescope.builtin")

-- require("telescope._extensions.zoxide.config").setup({
--   mappings = {
--     default = {
--       after_action = function(selection)
--         print("Update to (" .. selection.z_score .. ") " .. selection.path)
--       end
--     }
--   }
-- })


-- Configure the extension
t.setup({
  extensions = {
    zoxide = {
      mappings = {
        default = {
          after_action = function(selection)
            print("Update to (" .. selection.z_score .. ") " .. selection.path)
          end
        },
      },
    },
  },
})

-- Keymappings
vim.keymap.set("n", "<leader>cd", t.extensions.zoxide.list)

-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>cd",
-- 	":lua require'telescope'.extensions.zoxide.list{}<cr>",
-- 	{noremap = true, silent = true}
-- )


-- Load the extension
t.load_extension('zoxide')
