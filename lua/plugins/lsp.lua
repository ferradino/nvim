return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "texlab", "eslint", "ts_ls" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,

    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      require("lspconfig.ui.windows").default_options.border = "rounded"

      ui = { border = "rounded" }

      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })
      lspconfig.texlab.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })
      lspconfig.cmake.setup({
        capabilities = capabilities
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities
      })
      lspconfig.eslint.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          }
        }
      })

      vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
