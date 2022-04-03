local map = vim.api.nvim_set_keymap
local bmap = vim.api.nvim_buf_set_keymap
local opt = { noremap = true, silent = true }

map("n", "<Space>q", "<cmd>q<CR>", opt)

---------- Jump ----------
map("n", "<Space>[", "<C-o>", opt)
map("n", "<Space>]", "<C-i>", opt)

---------- Window ----------
map("n", "<Space>ws", "<C-w>s", opt) -- Split the window in two
map("n", "<Space>wv", "<C-w>v", opt) -- Split the window vertically
map("n", "<Space>wh", "<C-w>h", opt) -- Move the cursor to the left window
map("n", "<Space>wl", "<C-w>l", opt) -- Move the cursor to the right window
map("n", "<Space>wj", "<C-w>j", opt) -- Move the cursor to the below window
map("n", "<Space>wk", "<C-w>k", opt) -- Move the cursor to the above window
map("n", "<Space>wx", "<C-w>x", opt) -- Move the current window next
map("n", "<Space>wH", "<C-w>H", opt) -- Move the current window far left
map("n", "<Space>wL", "<C-w>L", opt) -- Move the current window far right


---------- Nvim Tree --------
-- Toggle file explorer
map("n", "<Space>ft", ":NvimTreeToggle<CR>", opt)
-- Export this keymapping table to /plugin-config/nvim-tree.lua
local nvim_tree_keymapping = {
  { key = "g?",		action = "toggle_help" },
  { key = "q",		action = "close" },
  -- Move
  { key = "h",		action = "parent_node" },
  { key = "l",		action = "cd" },
  -- Operate file
  { key = "o",		action = "edit" },
  { key = "a",		action = "create" }, -- to add a direcoty end with /
  { key = "r",		action = "rename" },
  { key = "d",		action = "remove" },
  { key = "c",		action = "copy" },
  { key = "p",		action = "paste" },
  { key = "x",		action = "cut" },
  -- Refresh
  { key = "<C-r>",	action = "refresh" },
  -- Split
  { key = "sg",		action = "split" },
  { key = "sv",		action = "vsplit" },
  -- Hidden file
  { key = ".",		action = "toggle_dotfiles" },
  { key = "I",		action = "toggle_git_ignored" },
  -- File info
  { key = "y",		action = "copy_name" },
  { key = "Y",		action = "copy_path" },
  { key = "gy",		action = "copy_absolute_path" },
  -- Collapse_all
  { key = "W",		action = "collapse_all" },
}

---------- Bufferline ----------
map("n", "<Space>b[", ":BufferLineCyclePrev<CR>", opt)
map("n", "<Space>b]", ":BufferLineCycleNext<CR>", opt)
map("n", "<Space>bq", ":bdelete<CR>", opt)
map("n", "<Space>bcl", ":BufferLineCloseRight<CR>", opt)
map("n", "<Space>bch", ":BufferLineCloseLeft<CR>", opt)

---------- highlight-current-n ----------
map("n", "n", "<Plug>(highlight-current-n-n)", { noremap = false, silent = true })
map("n", "N", "<Plug>(highlight-current-n-N)", { noremap = false, silent = true })


---------- Telescope ----------
map("n", "<Space>sf", "<cmd>Telescope find_files<CR>", opt)
map("n", "<Space>sg", "<cmd>Telescope live_grep<CR>", opt)


---------- Lsp ----------
map("n", "<Space>le", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
map("n", "<Space>gE", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
map("n", "<Space>ge", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)

local lsp_keymapping = function(client, bufnr)
  bmap(bufnr, "n", "<Space>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  bmap(bufnr, "n", "<Space>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  bmap(bufnr, "n", "<Space>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  bmap(bufnr, "n", "<Space>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  bmap(bufnr, "n", "<Space>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  bmap(bufnr, "n", "<Space>law", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
  bmap(bufnr, "n", "<Space>lrw", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
  bmap(bufnr, "n", "<Space>lw", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opt)
end

---------- Nvim Completion ----------
local nvim_cmp = function(cmp, luasnip)
  return {
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  }
end

---------- Toggleterm ----------
map("t", "<ESC>", "<C-\\><C-n>", opt)
map("n", "<Space>\\", "<cmd>exe v:count1 . 'ToggleTerm'<CR>", opt)
map("t", "<Space>\\", "<ESC><cmd>exe v:count1 . 'ToggleTerm'<CR>", opt)
map("n", "<Space>`", "<cmd>ToggleTermToggleAll<CR>", opt)

---------- Nvim Dap using vscode debug keybinding ----------
map("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opt)
map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opt)
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opt)
map("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opt)
map("n", "<S-F11>", "<cmd>lua require'dap'.step_out()<CR>", opt)
map("n", "<F6>", "<cmd>lua require'dap'.run_last()<CR>", opt)
map("n",
    "<F12>",
    "<cmd>lua require'dap'.close()<CR>\
    <cmd>lua require'dap.repl'.close()<CR>\
    <cmd>lua require'dapui'.close()<CR>\
    <cmd>DapVirtualTextForceRefresh<CR>", opt)

---------- Neoformat ----------
map("n", "<Space>ff", "<cmd>Neoformat<CR>", opt)

-- Module: keymappings
keymappings = {
  nvim_tree_keymapping = nvim_tree_keymapping,
  lsp_keymapping = lsp_keymapping,
  nvim_cmp = nvim_cmp
}
return keymappings
