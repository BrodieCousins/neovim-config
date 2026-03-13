local languages = {
}


return {
    {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',

    config = function()
        require'nvim-treesitter'.install {
            "javascript",
            "typescript",
            "python",
            "lua",
            "html",
            "css",
            "markdown",
            "csv",
        }
    end
    }
}

