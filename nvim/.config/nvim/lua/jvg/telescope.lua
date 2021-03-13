-- Inspired by tjdevries's config, TY!
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >',

    -- winblend = 0,
    -- preview_cutoff = 120,

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    -- layout_strategy = 'horizontal',
    -- layout_defaults = {
    --   horizontal = {
    --     width_padding = 0.1,
    --     height_padding = 0.1,
    --     preview_width = 0.6,
    --   },
    --   vertical = {
    --     width_padding = 0.05,
    --     height_padding = 1,
    --     preview_height = 0.5,
    --   }
    -- },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    prompt_position = "top",
    color_devicons = true,
  },
  extensions = {
      fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
      }
  },
}

require('telescope').load_extension('fzy_native')

local M = {}

--
M.edit_neovim = function()
  require('telescope.builtin').find_files {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/nvim",
    width = .25,

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

local themes = require('telescope.themes')

M.task_files = function()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    cwd = "~/Library/Mobile Documents/com~apple~CloudDocs/vimwiki/DearNova_projects",
    -- file_ignore_patterns = { "%Release.*" }
  }

  require('telescope.builtin').find_files(opts)
end

return M
