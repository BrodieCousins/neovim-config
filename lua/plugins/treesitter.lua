return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "lua", "luau" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
      
      -- Luau files use luau parser, lua files use lua parser
      vim.treesitter.language.register('luau', 'luau')
      vim.treesitter.language.register('lua', 'lua')
    end,
  },
}
