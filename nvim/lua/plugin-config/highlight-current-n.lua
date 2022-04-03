local ok_highlight_current_n, highlight_current_n = pcall(require, "highlight_current_n")

if not ok_highlight_current_n then
  vim.notify("[ERROR] Don't find the plugin 'highlight-current-n', please check 'plugins.lua'.")
  return
end

highlight_current_n.setup({
  highlight_group = "IncSearch"
})

vim.cmd([[
augroup ClearSearchHL
  autocmd!
  " You may only want to see hlsearch /while/ searching, you can automatically
  " toggle hlsearch with the following autocommands
  autocmd CmdlineEnter /,\? set hlsearch
  autocmd CmdlineLeave /,\? set nohlsearch
  " this will apply similar n|N highlighting to the first search result
  " careful with escaping ? in lua, you may need \\?
  autocmd CmdlineLeave /,\? lua require('highlight_current_n')['/,?']()
augroup END
]])
