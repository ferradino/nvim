return {
  {
    "neovim/nvim-lspconfig",
    
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      "folke/neodev.nvim",
    },

    config = function()
      require("neodev").setup()

      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })

      require("mason-lspconfig").setup({
        automatic_installation = { },
      })

      local servers = {
        bashls = {},
				clangd = {},
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							telemetry = { enabled = false },
						},
					},
				},
				pyright = {},
				sqlls = {},
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local default_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      for name, config in pairs(servers) do
				require("lspconfig")[name].setup({
					capabilities = default_capabilities,
					filetypes = config.filetypes,
					settings = config.settings,
				})
			end

      vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
}
