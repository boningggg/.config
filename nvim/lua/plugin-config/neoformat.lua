vim.g.neoformat_c_clangformat = {
  exe = "clang-format",
  args = {
    "-style='{BasedOnStyle: GNU, \
              IndentWidth: 8, \
              AlignConsecutiveDeclarations: true}'"
  }
}
vim.g.neoformat_enabled_c = { "clangformat" }

