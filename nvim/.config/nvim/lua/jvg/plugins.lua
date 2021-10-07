-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print("No packer.nvim found. Installing now!")
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
-- vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup {
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    -- use 'nvim-lua/completion-nvim'
    use 'hrsh7th/nvim-compe'
    use 'nvim-lua/lsp-status.nvim'

    use 'tjdevries/astronauta.nvim' -- Autorun lua files in ftplugins and plugins

    -- Neovim lsp useins
    -- See: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
    use 'neovim/nvim-lspconfig'
    --use 'tjdevries/nlua.nvim'
    --use 'tjdevries/lsp_extensions.nvim'

    -- Themes
    use 'tjdevries/colorbuddy.nvim'
    use 'ntk148v/vim-horizon'
    use 'gruvbox-community/gruvbox'
    use 'vim-airline/vim-airline'

    -- Neovim Tree shitter
    -- Info:    :TSInstallInfo
    -- Install: :TSInstall {language}
    use 'nvim-treesitter/nvim-treesitter'
    use {
      'nvim-treesitter/completion-treesitter',
      run = function() vim.cmd [[TSUpdate]] end
    }
    -- Show:    :TSPlaygroundToggle
    use 'nvim-treesitter/playground'
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',

        config = [[require("jvg/config/treesitter-textobjects")]],
    }
    use 'bryall/contextprint.nvim' -- Add context aware print debug statements

    -- Telescope is a highly extendable fuzzy finder over lists. Items are shown in a popup with a prompt to search over.
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    -- use '~/projects/_repos/telescope-simple-insert'
    use 'jvgrootveld/telescope-simple-insert'
    -- use '~/projects/_repos/telescope-zoxide'
    use {
        'jvgrootveld/telescope-zoxide',
        branch = 'main'
    }
    use {
        'sudormrfbin/cheatsheet.nvim',                 -- A searchable cheatsheet for neovim from within the editor using Telescope

        config = [[require("jvg/config/cheatsheet")]],

        requires = {
            {'nvim-telescope/telescope.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        }
    }

    use 'tpope/vim-surround'                           -- Provides mappings to easily delete, change and add such surroundings in pairs
    use 'tpope/vim-commentary'                         -- Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion
    use 'tpope/vim-fugitive'                           -- Git plugin
    use 'tpope/vim-rhubarb'                            -- If fugitive.vim is the Git, rhubarb.vim is the Hub
    use 'airblade/vim-gitgutter'                       -- Shows a git diff in the sign column. It shows which lines have been added, modified, or removed
    use 'junegunn/gv.vim'                              -- Git commit browser
    use {                                              -- A work-in-progress Magit clone for Neovim that is geared toward the Vim philosophy.
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim'
    }
    use 'vimwiki/vimwiki'                              -- Wiki in vim
    use 'mhinz/vim-startify'                           -- Fancy start screen
    use 'vim-utils/vim-man'                            -- View man pages in vim `:Man`
    use {
        'junegunn/fzf',
        run = function() vim.cmd [[fzf#install()]] end -- General-purpose command-line fuzzy finder
    }
    use 'junegunn/fzf.vim'                             -- FZF for vim
    -- use {
    --     'prettier/vim-prettier',
    --     run = 'yarn install',
    --     ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html' }
    -- }
    use 'junegunn/vim-easy-align'                      -- Vertical align
    use 'machakann/vim-highlightedyank'                -- Highlight yanked content
    use 'kassio/neoterm'                               -- Neovim/Vim terminal helper functions/commands
    -- peeks lines on `:<number>`
    -- use {
    --     'nacro90/numb.nvim',
    --     run = require('numb').setup()
    -- }

    -- Language support
    -- use {
    --     'fatih/vim-go',
    --     function() vim.cmd [[:GoUpdateBinaries]] end
    -- }

    -- WIP own plugins
    --use '~/projects/_repos/nvim-checkie-chan'

    -- use 'neoclide/coc.nvim', {'branch': 'release'} " True snippet and additional text editing support
    -- CoC recommended config
    -- let g:coc_start_at_startup = 1
    -- let g:coc_global_extensions = ['coc-json', 'coc-css', 'coc-yaml', 'coc-html', 'coc-markdownlint', 'coc-git']

    -- Maybies
    -- tweekmonster/gofmt.vim    " Runs gofmt when you save
    -- stsewd/fzf-checkout.vim   " Manage branches and tags with fzf
  end
}
