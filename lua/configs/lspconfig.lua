require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "gopls", "lua_ls" }
vim.lsp.enable(servers)
