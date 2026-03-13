-- theme & transparency
vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })


-- key mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- configs
require("config.floating_term")
require("config.lazy")

-- basic settings
vim.opt.number = true 			    -- line numbers
vim.opt.relativenumber = true 		-- relative line numbers
vim.opt.cursorline = true 		    -- highlight current line
vim.opt.wrap = false			    -- don't wrap lines
vim.opt.scrolloff = 10			    -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8 		    -- keep 8 columns left/right of cursor

-- indentation
vim.opt.tabstop = 2 			    -- tab width
vim.opt.shiftwidth = 2			    -- indent width
vim.opt.softtabstop = 4			    -- soft tap stop
vim.opt.expandtab = true		    -- use spaces instead of tabs
vim.opt.smartindent = true 		    -- smart auto-indenting
vim.opt.autoindent = true           -- copy indent from current line

-- search settings
vim.opt.ignorecase = true           -- case insensitive search
vim.opt.smartcase = true            -- case sensitive if uppercase in search
vim.opt.hlsearch = false            -- don't highlight search results
vim.opt.incsearch = true            -- show matches as you type

-- visual settings
vim.opt.termguicolors = true                            -- enable 24-bit colours
vim.opt.signcolumn = "yes"                              -- always show sign column
vim.opt.colorcolumn = "100"                             -- show column at 100 characters
vim.opt.showmatch = true                                -- highlight matching brackets
vim.opt.matchtime = 2                                   -- how long to show matching bracket
vim.opt.cmdheight = 1                                   -- command line height
vim.opt.completeopt = "menuone,noinsert,noselect"       -- completion options
vim.opt.showmode = false                                -- don't show mode in command line
vim.opt.pumheight = 10                                  -- popup menu height
vim.opt.pumblend = 10                                   -- popup menu transparency
vim.opt.winblend = 0                                    -- floating window transparency
vim.opt.conceallevel = 0                                -- dont hide markup
vim.opt.concealcursor = ""                              -- don't hide cursor line markup
vim.opt.lazyredraw = true                               -- don't redraw during macros
vim.opt.synmaxcol = 300                                 -- syntax highlighting limit

-- file handling
vim.opt.undofile = true                                 -- persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")       -- undo directory
vim.opt.autoread = true                                 -- auto reload files changed outside vim
vim.opt.autowrite = false                               -- dont auto save

-- behaviour settings
vim.opt.hidden = true                                   -- allow hidden beffors
vim.opt.errorbells = true                               -- have error bells
vim.opt.backspace = "indent,eol,start"                  -- better backspace behaviour
vim.opt.autochdir = false                               -- don't auto change directory
vim.opt.iskeyword:append("-")                           -- treat dash as part of the word
vim.opt.path:append("**")                               -- include subdirectories in search
vim.opt.selection = "exclusive"                         -- selection behaviour
vim.opt.mouse = "a"                                     -- enable mouse support
vim.opt.clipboard:append("unnamedplus")                 -- vim clipboard = system clipboard
vim.opt.encoding = "UTF-8"                              -- set encoding

-- diagnostics
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- splitting & resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })

-- move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- indenting in visual mode (better)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent left and reselect" })

-- file navigation
vim.keymap.set("n", "<leader>pv", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- system clipboard setup
local systemName = vim.loop.os_uname().sysname
if systemName ~= "Darwin" then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ["+"] = 'clip.exe',
            ["*"] = 'clip.exe',
        },
        paste = {
            ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0
    }
end

-- treesitter hihlight
    vim.api.nvim_create_autocmd('FileType', {
        pattern = { '<filetype>' },
        callback = function() vim.treesitter.start() end,
    })

-- create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
