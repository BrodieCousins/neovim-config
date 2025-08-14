return {
  "sainnhe/everforest",
  lazy = false, -- Load immediately
  priority = 1000, -- Make sure it loads before other colorschemes
  config = function()
    -- Optional: set Everforest-specific settings before loading
    vim.g.everforest_background = "medium" -- options: 'hard', 'medium', 'soft'
    vim.g.everforest_enable_italic = true
    vim.g.everforest_better_performance = 1

    -- Apply colorscheme
    vim.cmd.colorscheme("everforest")
  end,
}
