" Key mappings

" Definitions
let mapleader = " " " Map leader to space

" Remaps
nnoremap <leader>c :edit ~/.config/nvim/init.vim<CR>

"" Resize windows with ALT + hjkl
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

"" Navigate windows with CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" VimWiki
nmap <leader>1 1<Plug>VimwikiIndex
nmap <leader>2 2<Plug>VimwikiIndex
nmap <leader>3 3<Plug>VimwikiIndex
nmap <leader>4 4<Plug>VimwikiIndex
""nmap <leader>0 5<Plug>VimwikiIndex

"" Startify
nmap <leader>0 :Startify<CR>

"" Easy Align
""" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
""" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
