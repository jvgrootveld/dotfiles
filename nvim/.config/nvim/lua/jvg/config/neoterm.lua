-- Neoterm
-- https://github.com/kassio/neoterm
------------------------------------
-- Set default size for neoterm not to be half of screen
vim.api.nvim_set_var("neoterm_size", "25");

-- Show terminal window at bottom right instead of replacing current buffer
vim.api.nvim_set_var("neoterm_default_mod", "botright");

-- NOTE: Mappings are not mapped on vim start?
---- Mappings
--local key_prefix = "<leader>t"

---------------------------------------
---- Helper function for mapping neoterm mappings.
---- Default noremap and silent.
---- @param key Key to press after default prefix '<leader>t'
---- @param action Action command without ':' prefix and '<CR>' suffix
---------------------------------------
--local function createMap(key, action)
--    vim.api.nvim_set_keymap("n", key_prefix..key, ":"..action.."<CR>", { noremap = true })
--end

--createMap("n", "Tnew")    -- Create new command
--createMap("r", "T")       -- Run last command
--createMap("c", "Tclear")  -- Clear the neoterm
--createMap("t", "Ttoggle") -- Clear the neoterm
--createMap("q", "Tclose")  -- Clear the neoterm

---- Start new automatting on 'T'
--vim.api.nvim_set_keymap("n", key_prefix.."m", ":Tmap ", { noremap = true })

