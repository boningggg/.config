local ok_cmp, cmp = pcall(require, "cmp")

if not ok_cmp then
  vim.notify("[ERROR] Don't find the plugin 'nvim-cmp', please check 'plugins.lua'.")
  return
end

local ok_luasnip, luasnip = pcall(require, "luasnip")

if not ok_luasnip then
  vim.notify("[ERROR] Don't find the plugin 'luasnip', please check 'plugins.lua'.")
  return
end

local ok_cmp_under_comparator, cmp_under_comparator = pcall(require, "cmp-under-comparator")

if not ok_cmp_under_comparator then
  vim.notify("[ERROR] Don't find the plugin 'cmp-under-comparator', please check 'plugins.lua'.")
  return
end

cmp.setup({
  mapping = require("keymappings").nvim_cmp(cmp, luasnip),
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  sources = cmp.config.sources(
    {
      { name = "nvim_lsp" },
      { name = "luasnip" },
    },
    {
      { name = "buffer" },
      { name = "path" },
      { name = "cmdline" }
    }
  ),
  sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp_under_comparator.under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
  },
  })

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})
