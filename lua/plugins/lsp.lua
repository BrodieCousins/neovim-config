-- LSP configuration using vim.lsp.config (Neovim 0.11+)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      -- Lua LSP for .lua files
      vim.lsp.config('lua_ls', {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })
      
      -- Luau LSP for .luau files
      local luau_ok, luau_lsp = pcall(require, "luau-lsp")
      local luau_cmd = luau_ok and luau_lsp.get_bin_path and { luau_lsp.get_bin_path(), 'lsp' } or { 'luau-lsp', 'lsp' }
      
      vim.lsp.config('luau_lsp', {
        cmd = luau_cmd,
        filetypes = { 'luau' },
        root_markers = { '.git' },
        settings = {
          platform = { type = "roblox" },
        },
      })
      
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('luau_lsp')
      
      -- Diagnostics configuration
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })
    end,
  },
}
