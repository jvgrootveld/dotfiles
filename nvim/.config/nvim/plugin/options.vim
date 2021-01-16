" Settings
syntax enable             " Switch syntax highlighting on, when the terminal has colors
filetype plugin indent on " Defines autocommands that'll get executed when a file matching a given pattern is opened

" See https://neovim.io/doc/user/options.html
set nocompatible                  " Use vim, not vi api
set termguicolors                 " Enable terminnal gui colors
set number relativenumber         " Turn hybrid line numbers on
set nohlsearch                    " Turnn off highlight after search
set noerrorbells                  " Turn off ring a bell onn error
set tabstop=4 softtabstop=4       " Set tab size in spaces (this is for manual indenting)
set shiftwidth=4                  " The number of spaces inserted for a tab (used for auto indenting)
set expandtab                     " convert tabs to spaces
set smartindent                   " Do smart autoindenting when starting a new line
set nowrap                        " Turn off word wrap 
set smartcase                     " Ignore case in search
set noswapfile                    " No swap file
set nobackup                      " No backup files
set undodir=~/.vim/undodir        " List of directory names for undo files, separated with commas
set undofile                      " Automatically saves undo history to an undo file
set incsearch                     " Incremental searching (search as you type)
set scrolloff=8                   " Minimal number of screen lines to keep above and below the cursor
set showcmd                       " Show (partial) command in the last line of the screen
set encoding=utf-8                " String-encoding used internally
set autoread                      " Autoload files that have changed outside of vim
set clipboard+=unnamed            " use system clipboard http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set laststatus=2                  " Always show status bar
set list listchars=tab:--,trail:· " Highlight tailing tabs and spaces
set backspace=indent,eol,start    " Allow backspace to delete end of line, indent and start of line characters
set cmdheight=2                   " Number of screen lines to use for the command-line = Give more space for displaying messages.
set splitright                    " Splitting a window will put the new window right of the current one
set noshowmode                    " Turn off message if in Insert, Replace or Visual mode
set path+=**                      " Add recursive subfolder matching on find/tab completion

" CoC plugin
set updatetime=300                " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
set shortmess+=c                  " Don't pass messages to |ins-completion-menu|

" Not sure settings Test and check
set completeopt=menuone,noinsert,noselect " Options for Insert mode completion
set ignorecase                            " Make sure any searches /searchphrase doesn't need the \c escape character

" Check later
" ---------------------------------------
" set lazyredraw " redraw only when we need to (i.e. don't redraw when executing a macro)
" set showmatch " highlight a matching [{()}] when cursor is placed on start/end character

