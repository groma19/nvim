require("nvchad.configs.lspconfig").defaults()

local servers = { "gopls", "clangd", "lua_ls", "ts_ls", "html", "cssls", "eslint" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
