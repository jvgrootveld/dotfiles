-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/justinvangrootveld/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/justinvangrootveld/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/justinvangrootveld/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/justinvangrootveld/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/justinvangrootveld/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["cheatsheet.nvim"] = {
    config = { 'require("jvg/config/cheatsheet")' },
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  ["contextprint.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/contextprint.nvim"
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
  ["nvim-treesitter-textobjects"] = {
    config = { 'require("jvg/config/treesitter-textobjects")' },
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/packer.nvim"
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

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
require("jvg/config/treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: cheatsheet.nvim
time([[Config for cheatsheet.nvim]], true)
require("jvg/config/cheatsheet")
time([[Config for cheatsheet.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
