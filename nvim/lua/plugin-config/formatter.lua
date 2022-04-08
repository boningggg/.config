require("formatter").setup({
  filetype = {
    java = {
      function()
        return {
          exe = "clang-format",
          args = {
            "--assume-filename=" .. vim.fn.expand("%:t"),
            "-style='{\
              BasedOnStyle: LLVM, \
              IndentWidth: 4, \
              AlignAfterOpenBracket: Align, \
              AlignConsecutiveDeclarations: true, \
              AlignConsecutiveAssignments: true}'",
          },
          stdin = true,
        }
      end,
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--config-path " .. vim.fn.expand("%:p:h") .. "/stylua.toml",
            "-",
          },
          stdin = true,
        }
      end,
    },
  },
})
