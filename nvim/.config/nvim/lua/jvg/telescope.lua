-- Inspired by tjdevries's config, TY!
require('telescope').setup {
  defaults = {
    prompt_prefix = ' >',

    winblend = 0,
    preview_cutoff = 120,

    layout_strategy = 'horizontal',
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    prompt_position = "top",
    color_devicons = true,
  },
}

-- 
function edit_neovim()
  require('telescope.builtin').find_files {
    prompt_title = "~ dotfiles ~",
    shorten_path = true,
    cwd = "~/.config/nvim",
    width = .25,

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

local themes = require('telescope.themes')
function task_files()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    cwd = "~/Library/Mobile Documents/com~apple~CloudDocs/vimwiki/DearNova_projects",
    -- file_ignore_patterns = { "%Release.*" }
  }

  require('telescope.builtin').find_files(opts)
end

