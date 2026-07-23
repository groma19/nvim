local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    json = { "jq" },
  },
}

return options
