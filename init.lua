require("brodie.init")

--LSP Setup--
require("luau-lsp").setup {
  -- Basic configuration
  platform = { type = "roblox" },
  types = { roblox_security_level = "PluginSecurity" },
  strictMode = true,

  -- Optional: Enable sourcemap generation
  sourcemap = {
    enabled = true,
    autogenerate = true,
    rojo_project_file = "default.project.json",
    sourcemap_file = "sourcemap.json",
  },

  -- Optional: Enable companion plugin
  plugin = {
    enabled = true,
    port = 3667,
  },
}
