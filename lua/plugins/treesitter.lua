return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "go", "latex" },
      highlight = { enable = true },
      ident = { enable = true },

      ignore_install = { "help" },

    })
  end
}
