-- Config for telescope-simple-insert
-- See: https://github.com/jvgrootveld/telescope-simple-insert

vim.api.nvim_set_keymap(
	'n',
	'<leader>i',
	":lua R'telescope'.extensions.simple_insert.select{}<CR>",
	{noremap = true, silent = true}
)

