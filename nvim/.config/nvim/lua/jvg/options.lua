-- This will be available for everyone when TJ merge:
--  https://github.com/neovim/neovim/pull/13479
-- Until then, you can check out `./lua/jvg/globals/opt.lua
local opt = vim.opt

-- Ignore compiled files
opt.wildignore = '__pycache__'
opt.wildignore = opt.wildignore + { '*.o' , '*~', '*.pyc', '*pycache*' }

opt.wildmode = {'longest', 'list', 'full'}

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17

opt.wildmode = opt.wildmode - 'list'
opt.wildmode = opt.wildmode + { 'longest', 'full' }

opt.wildoptions = 'pum'


-- See https://neovim.io/doc/user/options.html
opt.termguicolors  = true  -- Enable terminnal gui colors
opt.showmode       = false -- Turn off message if in Insert, Replace or Visual mode
opt.showcmd        = true  -- Show (partial) command in the last line of the screen
opt.cmdheight      = 2     -- Number of screen lines to use for the command-line = Give more space for displaying messages.
opt.incsearch      = true  -- Incremental searching (search as you type)
opt.showmatch      = true  -- show matching brackets when text indicator is over them
opt.relativenumber = true  -- Show line numbers
opt.number         = true  -- But show the actual number for the line we're on
opt.ignorecase     = true  -- Ignore case when searching...
opt.smartcase      = true  -- ... unless there is a capital letter in the query
opt.hidden         = true  -- I like having buffers stay around
opt.equalalways    = false -- [CHECK] I don't like my windows changing all the time
opt.splitright     = true  -- Prefer windows splitting to the right
opt.splitbelow     = true  -- Prefer windows splitting to the bottom
opt.updatetime     = 1000  -- Make updates happen faster
opt.hlsearch       = false -- Turnn off highlight after search
opt.scrolloff      = 10    -- Minimal number of screen lines to keep above and below the cursor

-- Tabs
opt.autoindent     = true
opt.cindent        = true
opt.wrap           = false -- Turn off word wrap
--set smartindent                   " Do smart autoindenting when starting a new line

opt.tabstop        = 4     -- Set tab size in spaces (this is for manual indenting)
opt.shiftwidth     = 4     -- The number of spaces inserted for a tab (used for auto indenting)
opt.softtabstop    = 4
opt.expandtab      = true  -- Convert tabs to spaces

opt.foldmethod     = 'marker'
opt.foldlevel      = 0
opt.modelines      = 1

opt.belloff        = 'all' -- The sound of silence!

opt.clipboard      = 'unnamedplus' --  use system clipboard http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals

opt.inccommand     = 'split' -- Show split window on substitution
opt.swapfile       = false   -- No swap file
opt.shada          = { "!", "'1000", "<50", "s10", "h" } -- On exit enables you to continue where you left off. No idea what the option do, copied from TJ

-- [CHECK] copied from TJ
opt.formatoptions = opt.formatoptions
                    - 'a'     -- Auto formatting is BAD.
                    - 't'     -- Don't auto format my code. I got linters for that.
                    + 'c'     -- In general, I like it when comments respect textwidth
                    + 'q'     -- Allow formatting comments w/ gq
                    - 'o'     -- O and o, don't continue comments
                    + 'r'     -- But do continue when pressing enter.
                    + 'n'     -- Indent past the formatlistpat, not underneath it.
                    + 'j'     -- Auto-remove comments if possible.
                    - '2'     -- I'm not in gradeschool anymore

opt.joinspaces = false         -- Dont insert two spaces after a '.', '?' and '!' with a join command

opt.fillchars = { eob = "~" } -- [CHECK] add '~' on empty lines on end of buffer

-- set nobackup                      " No backup files
-- set undodir=~/.vim/undodir        " List of directory names for undo files, separated with commas
-- set undofile                      " Automatically saves undo history to an undo file
-- set encoding=utf-8                " String-encoding used internally
-- set autoread                      " Autoload files that have changed outside of vim
-- set laststatus=2                  " Always show status bar
-- set list listchars=tab:--,trail:· " Highlight tailing tabs and spaces
-- set backspace=indent,eol,start    " Allow backspace to delete end of line, indent and start of line characters
-- set path+=**                      " Add recursive subfolder matching on find/tab completion
