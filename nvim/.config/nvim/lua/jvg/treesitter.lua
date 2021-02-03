-- -- WIP markdown module
-- require'nvim-treesitter'.define_modules {
--     jvg = {
--         enable = true,
--         disable = {},
--         attach = function(bufnr, lang)
--             print(string.format("MAIN Attach. buffnr '%s' lang '%s'", bufnr, lang))
--         end,
--         detach = function(bufnr)
--             print(string.format("MAIN Detach. buffnr '%s'", bufnr))
--         end,
--         is_supported = function(lang)
--             return lang == "markdown"
--         end
--     }
-- }
-- Enable highlighting through treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true
  },
  checkie_chan = {
    enable = true
  }
}

-- Add Markdown with custom repo
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.markdown = {
  install_info = {
    url = "~/projects/_repos/tree-sitter-markdown", -- local path or git repo
    files = {"src/parser.c", "src/binding.cc", "src/scanner.cc"}
  },
  used_by = {"vimwiki"}
}

-- Enable playground
require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
}

