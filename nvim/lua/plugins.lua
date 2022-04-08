local ok_packer, packer = pcall(require, "packer")

if not ok_packer then
  vim.notify("[ERROR] Don't find the plugin 'packer', please install it.")
  return
end

---------- Package manager - packer ----------
packer.startup({
  function()
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Colorschemes
    use({
      "olimorris/onedarkpro.nvim",
      config = function()
        require("plugin-config.onedarkpro")
      end,
    })

    -- Language Highlighting Pro
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("plugin-config.nvim-treesitter")
      end,
    })

    -- File Explorer
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugin-config.nvim-tree")
      end,
    })

    -- Tabline
    use({
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugin-config.bufferline")
      end,
    })

    -- Statusline
    use({
      "nvim-lualine/lualine.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("plugin-config.lualine")
      end,
    })

    -- Highlighting Search
    use({
      "rktjmp/highlight-current-n.nvim",
      config = function()
        require("plugin-config.highlight-current-n")
      end,
    })

    -- Find, Filter, Preview, Pick.
    use({
      "nvim-telescope/telescope.nvim",
      requires = "nvim-lua/plenary.nvim",
    })

    -- Language Server Protocol
    use({
      "neovim/nvim-lspconfig",
      requires = "williamboman/nvim-lsp-installer",
      config = function()
        require("plugin-config.nvim-lspconfig")
      end,
    })

    -- Completion
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
        "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
        "hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths
        "hrsh7th/cmp-cmdline", -- nvim-cmp source for vim's cmdline
        -- Snippet
        "L3MON4D3/LuaSnip", -- Snippet engine for Neovim written in Lua
        "saadparwaiz1/cmp_luasnip", -- Luasnip completion source
        -- Better sort completion items
        "lukas-reineke/cmp-under-comparator",
      },
      config = function()
        require("plugin-config.nvim-cmp")
      end,
    })

    -- Terminal integration
    use({
      "akinsho/toggleterm.nvim",
      config = function()
        require("plugin-config.toggleterm")
      end,
    })

    -- Debug
    use({
      "mfussenegger/nvim-dap",
      config = function()
        require("plugin-config.nvim-dap")
      end,
    })
    use({
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
    })
    use({
      "rcarriga/nvim-dap-ui", -- UI for dap
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("plugin-config.nvim-dap-ui")
      end,
    })

    -- Format
    use({
      "mhartington/formatter.nvim",
      config = function()
        require("plugin-config.formatter")
      end,
    })
  end, -- End adding plugins

  -- Using a floating window
  config = { display = { open_fn = require("packer.util").float } },
})

-- Automatically run PackerSync.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
