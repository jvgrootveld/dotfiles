" Keymaps

" Set kj to be escape in insert mode
inoremap kj <esc>

" Run the last command
nnoremap <leader><leader>c :<up>

" Map execute this line
function! s:executor() abort
  if &ft == 'lua'
    call execute(printf(":lua %s", getline(".")))
  elseif &ft == 'vim'
    exe getline(">")
  endif
endfunction
nnoremap <leader>x :call <SID>executor()<CR>

vnoremap <leader>x :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

" Execute this file
function! s:save_and_exec() abort
  if &filetype == 'vim'
    :silent! write
    :source %
  elseif &filetype == 'lua'
    :silent! write
    :luafile %
  endif

  return
endfunction
nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>

" Rmove whitespace
nnoremap <leader>sws :%s/\s\+$//<CR>

nnoremap <leader>c :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>e :Buffers<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fb :lua R('telescope.builtin').buffers()<CR>
nnoremap <leader>fc :lua R('jvg.config.telescope').edit_neovim()<CR>
nnoremap <leader>ft :lua R('jvg.config.telescope').task_files()<CR>

"" Paste inner '`' and yank it back into the register
nnoremap <leader>` vi`pvi`y

"" Navigate windows with CTRL + hjkl
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Make windows to be basically the same size
nnoremap <leader>= <C-w>=

" Sizing window horizontally
nnoremap <M-Left> <C-W><
nnoremap <M-Right> <C-W>>
"" Shorter
nnoremap <M-Down> <C-W>-
"" Taller
nnoremap <M-Up> <C-W>+

"" VimWiki
nmap <leader>1 1<Plug>VimwikiIndex
nmap <leader>2 2<Plug>VimwikiIndex
nmap <leader>3 3<Plug>VimwikiIndex
nmap <leader>4 4<Plug>VimwikiIndex
""nmap <leader>0 5<Plug>VimwikiIndex

"" Startify
nnoremap <leader>0 :Startify<CR>

"" Easy Align
""" Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap ga <Plug>(EasyAlign)
""" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

"" Neoterm
" Create new command
nnoremap <leader>tn :Tnew<CR>
" Run last command
nnoremap <leader>tr :call neoterm#map_do()<CR>
" Clear the neoterm
nnoremap <leader>tc :Tclear<CR>
" Clear the neoterm
nnoremap <leader>tt :Ttoggle<CR>
" Clear the neoterm
nnoremap <leader>tq :Tclose<CR>
" Start new automatting on 'T'
nnoremap <leader>tm :Tmap 

