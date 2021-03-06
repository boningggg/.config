local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
  vim.notify("[ERROR] Don't find the plugin toggleterm.")
  return
end

toggleterm.setup({
  -- size can be a number or function which is passed the current terminal
  size = 10,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  close_on_exit = true, -- close the terminal window when the process exits
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = "single",
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})
