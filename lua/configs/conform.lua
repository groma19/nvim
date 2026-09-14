local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    go = { "gofmt" },
    json = { "jq" },
  },
}

return options
