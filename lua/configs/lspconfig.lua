require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "lua_ls" }
vim.lsp.enable(servers)
