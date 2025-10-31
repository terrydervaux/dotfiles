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
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "just",
          "clangd",
          "pyright",
          "bashls",
        },
        -- do not automatically install LSP since we are managing them manually
        -- below to integrate with blink.cmp
        automatic_enable = false,
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
      -- retrieve blink cmp capabilities
      local capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      }
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

      -- configure LSP servers
      local lspconfig = require("lspconfig")
      lspconfig.just.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.bashls.setup({ capabilities = capabilities })

      lspconfig.rust_analyzer.setup({ capabilities = capabilities })
      -- -- configure Rust LSP for android hardware dev
      -- local current_work_directory = vim.loop.cwd()
      -- local ndk_version = "25.2.9519653"
      -- local android_home = os.getenv("ANDROID_HOME") or "/your/android/sdk/path"
      -- local ndk_home = android_home .. "/ndk/" .. ndk_version
      -- local toolchain_root = ndk_home .. "/toolchains/llvm/prebuilt/linux-x86_64"
      -- local cargo_android_hw_env = {
      --   ANDROID_NDK_VERSION = ndk_version,
      --   ANDROID_NDK_HOME = ndk_home,
      --   NDK_TOOLCHAIN_ROOT = toolchain_root,
      --   PATH = toolchain_root .. "/bin:" .. os.getenv("PATH"),
      --   CMAKE_TOOLCHAIN_FILE = ndk_home .. "/build/cmake/android.toolchain.cmake",
      --   ANDROID_NDK = ndk_home,
      --   CARGO_BUILD_TARGET = "aarch64-linux-android",
      --   CC = "aarch64-linux-android33-clang",
      --   CXX = "aarch64-linux-android33-clang",
      --   ANDROID_ABI = "arm64-v8a",
      --   CXXSTDLIB_aarch64_linux_android = "c++_static",
      --   KANZI_RUST_PLATFORM = "linux_bs_drm_aarch64_ndk",
      --   KANZI_HOME = current_work_directory .. "/crates/platform_graphics",
      --   V4L2R_VIDEODEV2_H_PATH = "",
      -- }

      -- lspconfig.rust_analyzer.setup({
      --   capabilities = capabilities,
      --   cmd_env = cargo_android_hw_env,
      --   settings = {
      --     ["rust-analyzer"] = {
      --       cargo = {
      --         target = "aarch64-linux-android",
      --       },
      --     },
      --   },
      -- })

      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })

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
