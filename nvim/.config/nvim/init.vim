" Go to file under cursor: `gf`
" Go back with `<C+^>`

call plug#begin('~/.config/nvim/plugged')

"" Themes
Plug 'ntk148v/vim-horizon'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'

" Specific NeoVim Nightly 0.5 plugins
if has("nvim-0.5")
    " Neovim Tree shitter
    " Info:    :TSInstallInfo
    " Install: :TSInstall {language}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Show:    :TSPlaygroundToggle
    Plug 'nvim-treesitter/playground'

    " Neovim lsp Plugins
    " See: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    "Plug 'tjdevries/nlua.nvim'
    "Plug 'tjdevries/lsp_extensions.nvim'
endif

Plug 'tpope/vim-surround'                           " Provides mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-commentary'                         " Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion
Plug 'tpope/vim-fugitive'                           " Git plugin
Plug 'tpope/vim-rhubarb'                            " If fugitive.vim is the Git, rhubarb.vim is the Hub
Plug 'airblade/vim-gitgutter'                       " Shows a git diff in the sign column. It shows which lines have been added, modified, or removed
Plug 'junegunn/gv.vim'                              " Git commit browser
Plug 'vimwiki/vimwiki'                              " Wiki in vim
Plug 'mhinz/vim-startify'                           " Fancy start screen
Plug 'vim-utils/vim-man'                            " View man pages in vim `:Man`
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " General-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim'                             " FZF for vim
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'junegunn/vim-easy-align'                      " Vertical align
Plug 'machakann/vim-highlightedyank'                " Highlight yanked content
Plug 'kassio/neoterm'                               " Neovim/Vim terminal helper functions/commands

"" Telescope is a highly extendable fuzzy finder over lists. Items are shown in a popup with a prompt to search over.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"" WIP own plugins
Plug '~/projects/_repos/nvim-checkie-chan'

" Plug 'neoclide/coc.nvim', {'branch': 'release'} " True snippet and additional text editing support
" CoC recommended config
" let g:coc_start_at_startup = 1
" let g:coc_global_extensions = ['coc-json', 'coc-css', 'coc-yaml', 'coc-html', 'coc-markdownlint', 'coc-git']

"" Maybies
" tweekmonster/gofmt.vim    " Runs gofmt when you save
" stsewd/fzf-checkout.vim   " Manage branches and tags with fzf

call plug#end()

" Not sure why this is not sources automatically
" Maybe because i'm not using a init.lua config?
:lua require("init")

" Key mappings

" Definitions
let mapleader = " "

" Remaps
nnoremap <leader>c :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>e :Buffers<CR>
nnoremap <leader>f :Telescope find_files<CR>

"" Paste inner '`' and yank it back into the register
nnoremap <leader>` vi`pvi`y

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

" Commands

"" FZF
let b:project_dir='$HOME/Library/Mobile Documents/com~apple~CloudDocs/vimwiki'

command! ProjectFiles 
            \ :lua require'telescope.builtin'.find_files({ find_command = { 'find', '/Users/justinvangrootveld/Library/Mobile Documents/com~apple~CloudDocs/vimwiki', '-type', 'f' } })


" command! -bang ProjectFiles
"         \ call fzf#vim#files(b:project_dir, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)
