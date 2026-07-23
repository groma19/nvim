local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    json = { "jq" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
  },
}

return options
