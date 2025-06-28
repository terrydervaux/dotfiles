return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "saghen/blink.cmp",
    "nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "second-brain",
        path = "~/cloud/icloud/Obsidian/second-brain",
      },
    },
    -- disable obsidian UI formtting
    ui = {
      enable = false,
    },
    -- use blink for completion
    completation = {
      nvim_cmp = false,
      blink = true,
      min_cars = 2,
    },
  },
}
