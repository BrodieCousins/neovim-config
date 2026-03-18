return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },

        config = function()
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            pathStrict = false, -- let vim globals work
                        },
                    },
                },
            })
            vim.lsp.enable('lua_ls')
            vim.lsp.enable('ts_ls')
            vim.lsp.enable('pylsp')

            local base_on_attach = vim.lsp.config.eslint.on_attach
            vim.lsp.config("eslint", {
                on_attach = function(client, bufnr)
                    if not base_on_attach then return end

                    base_on_attach(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "LspEslintFixAll",
                    })
                end,
            })
            vim.lsp.enable("eslint")
        end,
    }
}
