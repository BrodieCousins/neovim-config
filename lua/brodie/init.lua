--== IMPORTS ==--
require("brodie.remap")
require("brodie.lazy")
require("brodie.greeting")

--== CONFIG ==--

--Error messages inline
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Tabs = 2 Spaces
vim.opt.expandtab = true  -- converts tabs to spaces
vim.opt.shiftwidth = 2  -- number of spaces to use for an Indentation
vim.opt.tabstop = 2  -- number of spaces a <Tab> counts for
vim.opt.smartindent = true  -- auto-indenting for new lines
