-- Config for: vim-codepainter
-- See: https://github.com/lpinilla/vim-codepainter

-- <F4> to paint all text on current line
vim.api.nvim_set_keymap(
	'n',
	'<F4>',
	"^v$:<c-u> call codepainter#paintText(visualmode())<CR>",
	{noremap = true, silent = true}
)

