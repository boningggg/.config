vim.g.neoformat_c_clangformat = {
  exe = "clang-format",
  args = {
    "-assume-filename=" .. vim.fn.expand("%:t"),
    "-style='{BasedOnStyle: GNU, \
              IndentWidth: 8, \
              AlignConsecutiveDeclarations: true}'"
  },
  stdin = 1
}
vim.g.neoformat_enabled_c = { "clangformat" }

vim.g.neoformat_java_clangformat = {
  exe = "clang-format",
  args = {
    "-assume-filename=" .. vim.fn.expand("%:t"),
    "-style='{BasedOnStyle: LLVM, \
              IndentWidth: 4, \
              AlignConsecutiveDeclarations: true}'"
  },
  stdin = 1
}
vim.g.neoformat_enabled_java = { "clangformat" }

