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
  ["cheatsheet.nvim"] = {
    config = { 'require("jvg/config/cheatsheet")' },
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  gruvbox = {
    config = { ' vim.cmd "colorscheme gruvbox" ' },
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/neogit"
  },
  neoterm = {
    config = { 'require("jvg.config.neoterm")' },
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/neoterm"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nP\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\22jvg.config.lsp_go\23jvg.config.lsp_lua\frequire\0" },
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { 'require("jvg.config.treesitter")' },
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { 'require("jvg.config.treesitter-textobjects")' },
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
  ["telescope-zoxide"] = {
    config = { "\27LJ\2\ns\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\1K\0\1\0 jvg.config.telescope-zoxide\vzoxide\19load_extension\14telescope\frequire\0" },
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
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-highlightedyank"] = {
    config = { 'require("jvg.config.highlightedyank")' },
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/justinvangrootveld/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("jvg.config.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope-zoxide
time([[Config for telescope-zoxide]], true)
try_loadstring("\27LJ\2\ns\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\1K\0\1\0 jvg.config.telescope-zoxide\vzoxide\19load_extension\14telescope\frequire\0", "config", "telescope-zoxide")
time([[Config for telescope-zoxide]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
require("jvg.config.treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: vim-highlightedyank
time([[Config for vim-highlightedyank]], true)
require("jvg.config.highlightedyank")
time([[Config for vim-highlightedyank]], false)
-- Config for: neoterm
time([[Config for neoterm]], true)
require("jvg.config.neoterm")
time([[Config for neoterm]], false)
-- Config for: cheatsheet.nvim
time([[Config for cheatsheet.nvim]], true)
require("jvg/config/cheatsheet")
time([[Config for cheatsheet.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\22jvg.config.lsp_go\23jvg.config.lsp_lua\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
 vim.cmd "colorscheme gruvbox" 
time([[Config for gruvbox]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
