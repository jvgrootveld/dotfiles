" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/justinvangrootveld/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/justinvangrootveld/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/justinvangrootveld/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/justinvangrootveld/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/justinvangrootveld/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  fzf = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  neoterm = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/neoterm"
  },
  ["numb.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-simple-insert"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/telescope-simple-insert"
  },
  ["telescope-zoxide"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-horizon"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-horizon"
  },
  ["vim-man"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-man"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  vimwiki = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
