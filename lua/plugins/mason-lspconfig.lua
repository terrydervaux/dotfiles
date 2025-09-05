return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "just", "clangd" },
      })
    end,
  },
  {
    -- setup communication between nvim and LSP servers
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      -- lsp install
      lspconfig.just.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })

      -- keybinding
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

      -- keybinding for specific LSP
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then
            return
          end

          if vim.bo.filetype == "lua" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })

      -- display error inline
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- Could be '●', '▎', 'x'
          spacing = 2,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}
