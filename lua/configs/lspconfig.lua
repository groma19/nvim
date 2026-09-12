require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "lua_ls", "ts_ls", "html", "cssls", "eslint" }
vim.lsp.enable(servers)
