--local M = {}

--function M.toggleInlayHints()
--vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
--end

--return M
------------------------------------------------
-- ~/.config/nvim/lua/lsp.lua
local lspconfig = require("lspconfig")

-- Define the capabilities for autocompletion (optional, if using nvim-cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Define the on_attach function to configure keybindings
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Key mappings for LSP actions
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
end

-- Setup for TypeScript server (tsserver)
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities, -- Use for autocompletion
  settings = {
    tsserver = {
      format = { enable = true }, -- Enable formatting
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
})

-- Setup for Python server (pyright)
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities, -- Use for autocompletion
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict", -- Enable strict type checking
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
})
