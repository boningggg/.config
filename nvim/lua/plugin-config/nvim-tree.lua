local ok, nvim_tree = pcall(require, "nvim-tree")

if not ok then
  vim.notify("[ERROR] Don't find the plugin nvim-tree.")
  return
end

local nvim_tree_keymapping = require("keymappings").nvim_tree_keymapping

nvim_tree.setup({
  view = {
    mappings = {
      custom_only = true,
      list = nvim_tree_keymapping,
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  })
