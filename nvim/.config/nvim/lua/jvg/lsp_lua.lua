local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local lsp = vim.lsp
local buf_keymap = vim.api.nvim_buf_set_keymap
local cmd = vim.cmd

vim.cmd [[packadd nvim-lspconfig]]
-- vim.cmd [[packadd nvim-compe]]

-- lsp_status.config {
--     current_function = false
-- }

lsp_status.register_progress()
lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true
})

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/Users/justinvangrootveld/third_party/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/macOS/lua-language-server"

local keymap_opts = {noremap = true, silent = true}
local function on_attach(client)
  lsp_status.on_attach(client)
  buf_keymap(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', keymap_opts)
  buf_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
  buf_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
  buf_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', keymap_opts)
  buf_keymap(0, 'n', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
  buf_keymap(0, 'n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', keymap_opts)
  buf_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
  buf_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', keymap_opts)
  buf_keymap(0, 'n', 'gA', '<cmd>lua vim.lsp.buf.code_action()<CR>', keymap_opts)
  buf_keymap(0, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
             keymap_opts)
  buf_keymap(0, 'n', '<leader>E', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', keymap_opts)
  buf_keymap(0, 'n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', keymap_opts)
  buf_keymap(0, 'n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', keymap_opts)

  if client.resolved_capabilities.document_formatting then
    buf_keymap(0, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
  end

  if client.resolved_capabilities.document_highlight == true then
    cmd('augroup lsp_aucmds')
    cmd('au CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
    cmd('au CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()')
    cmd('au CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
    cmd('augroup END')
  end
end

local servers = {
    bashls = {},
    cssls = {
        filetypes = {"css", "scss", "less", "sass"},
        root_dir = lspconfig.util.root_pattern("package.json", ".git")
    },
    html = {},
    jsonls = {cmd = {'json-languageserver', '--stdio'}},
    sumneko_lua = {
        cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';'),
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                },
            },
        },
    },
    vimls = {}
}

local snippet_capabilities = {
  textDocument = {completion = {completionItem = {snippetSupport = true}}}
}

for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend('keep', config.capabilities or {},
                                            lsp_status.capabilities, snippet_capabilities)
  lspconfig[server].setup(config)
end












---------------------------------

-- Custom setup for lua
-- require'lspconfig'.sumneko_lua.setup {
--   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = vim.split(package.path, ';'),
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = {
--           [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--           [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--         },
--       },
--     },
--   },
--   -- on_attach = require'completion'.on_attach
--
