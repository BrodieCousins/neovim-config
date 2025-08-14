return {
  -- LSP config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Example: Lua LSP
      require('lspconfig').lua_ls.setup {
        capabilities = capabilities,
      }

      -- Add other LSP servers here
      -- require('lspconfig').pyright.setup { capabilities = capabilities }
    end,
  },

  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP completions
      "hrsh7th/cmp-buffer",   -- Buffer completions
      "hrsh7th/cmp-path",     -- File path completions
      "hrsh7th/cmp-cmdline",  -- Command line completions
      "hrsh7th/cmp-vsnip",    -- Snippet completions
      "hrsh7th/vim-vsnip",    -- Snippet engine
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For vsnip users
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Cmdline `/` and `?` for buffer completion
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })

      -- Cmdline `:` for path and cmdline completion
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
}

