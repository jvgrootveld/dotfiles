-- Inspired by tjdevries's config, TY!
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '❯ ',

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
    prompt_title = "[ NVIM config files ]",
    shorten_path = false,
    cwd = "~/.config/nvim",

    layout_strategy = 'horizontal',
    layout_config = {
      preview_width = 0.65,
    },
  }
end

local themes = require('telescope.themes')

M.task_files = function()
  local opts = themes.get_dropdown {
    prompt_title = "[ Work Task Files ]",
    winblend = 10,
    border = true,
    cwd = "~/Library/Mobile Documents/com~apple~CloudDocs/vimwiki/DearNova_projects",
    -- file_ignore_patterns = { "%Release.*" }
  }

  require('telescope.builtin').find_files(opts)
end

-- Zoxide config
local z_utils = require("telescope._extensions.zoxide.utils")
require("telescope._extensions.zoxide.config").setup({
  mappings = {
    default = {
      after_action = function(selection)
        print("Update to (" .. selection.z_score .. ") " .. selection.path)
      end
    }
  }
})

----------------------------------
---- WIP -------------------------
----------------------------------


local Job = require('plenary.job')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values
local previewers = require('telescope.previewers')
local Previewer = require('telescope.previewers.previewer')
local putils = require('telescope.previewers.utils')

local get_jira_access_token = function()
  return os.getenv("JIRA_CROWD_TOKEN")
end

local dn_jira_base_url = "https://issues.dearnova.nl/browse/"

local open_jira_task = function (prompt_bufnr)
    local selection = action_state.get_selected_entry()
    local key = selection.value.key
    vim.fn.execute("!open " .. dn_jira_base_url .. key, "silent")

    actions.close(prompt_bufnr)
end

-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/builtin/internal.lua#L148
M.wip = function()
  local opts = themes.get_dropdown {
      width = 0.50
  }

  pickers.new(opts, {
    prompt_title = '[ Work in progress ]',

    finder = finders.new_table {
    results = (function()
        -- local items = {
        --     { id = 1, name = "foo" },
        --     { id = 2, name = "bar" },
        --     { id = 3, name = "baz" },
        -- }
        local result = vim.fn.json_decode(table.concat(Job:new {
            command = "/Users/justinvangrootveld/projects/_repos/go-jira/bin/jira",
            args = {
                "tasks",
                "--json",
            },
            env = {
                JIRA_CROWD_TOKEN = get_jira_access_token(),
            }
        }:sync(), '5000'))

        if result.isOk ~= true then
            print("Jira Task result error: " .. result.error)
            return
        end

        return result.data.issues
      end)(),
      entry_maker = function(item)
        local line = item.key .. " | " .. item.fields.summary;
        return {
          value = item,
          ordinal = line,
          display = line
        }
      end
    },
    -- previewer = previewers.display_content,
    previewer = previewers.new_buffer_previewer {
        get_buffer_by_name = function(_, entry)
            return entry.value.key
        end,

        define_preview = function(self, entry, status)
            print("Prev: " .. entry.value.key)
            -- putils.job_maker({ "/Users/justinvangrootveld/projects/_repos/go-jira/bin/jira", "task", entry.value.key }, self.state.bufnr, {
            --     value = entry.value,
            --     bufname = self.state.bufname
            -- })
            -- putils.regex_highlighter(self.state.bufnr, 'diff')
            vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, {entry.value.fields.summary})
        end
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        print("You selected:", selection.value.key)
      end)

      map('i', '<c-t>', function() open_jira_task(prompt_bufnr) end)
      map('n', '<c-t>', function() open_jira_task(prompt_bufnr) end)

      return true
    end,
  }):find()
end


-- nnoremap <leader>ww :lua R('jvg.telescope').wip()<CR>

return M
