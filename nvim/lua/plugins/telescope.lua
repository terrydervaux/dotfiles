return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", function()
        builtin.find_files({
          hidden = true,
          file_ignore_patterns = { "%.git/" },
        })
      end, { desc = "Telescope find files" })

      vim.keymap.set("n", "<leader>fd", function()
        builtin.find_files({
          hidden = true,
          file_ignore_patterns = { "%.git/" },
        })
      end, { desc = "Telescope find files" })

      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>en", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end, { desc = "Telescope find neovim config files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

      -- obsidian related keymap
      local notes_dir = vim.fn.expand("~/cloud/icloud/Obsidian/second-brain")
      vim.keymap.set("n", "<leader>fn", function()
        require("telescope.builtin").find_files({
          cwd = notes_dir,
        })
      end, { desc = "Telescope find notes" })
      vim.keymap.set("n", "<leader>fng", function()
        require("telescope.builtin").live_grep({
          cwd = notes_dir,
        })
      end, { desc = "Telescope live grep notes" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
