call plug#begin('~/.config/nvim/plugged')

"" Neovim lsp Plugins
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'
"Plug 'tjdevries/nlua.nvim'
"Plug 'tjdevries/lsp_extensions.nvim'

"" Themes
Plug 'ntk148v/vim-horizon'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-fugitive'   " Git plugin
Plug 'vimwiki/vimwiki'      " Wiki in vim
Plug 'mhinz/vim-startify'   " Fancy start screen
Plug 'vim-utils/vim-man'    " View man pages in vim `:Man`
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " General-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim'     " FZF for vim
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'junegunn/vim-easy-align' " Vertical align

"" Telescope is a highly extendable fuzzy finder over lists. Items are shown in a popup with a prompt to search over.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Plug 'neoclide/coc.nvim', {'branch': 'release'} " True snippet and additional text editing support
" CoC recommended config
" let g:coc_start_at_startup = 1
" let g:coc_global_extensions = ['coc-json', 'coc-css', 'coc-yaml', 'coc-html', 'coc-markdownlint', 'coc-git']

"" Maybies
" tweekmonster/gofmt.vim    " Runs gofmt when you save
" stsewd/fzf-checkout.vim   " Manage branches and tags with fzf

call plug#end()

" After plugin
"" This executes the command silently and ignores errors
silent! colorscheme gruvbox
set background=dark

" Load custom plugin config
for f in split(glob('$HOME/.config/nvim/config/plugin_*.vim'), '\n')
    exe 'source' f
endfor
