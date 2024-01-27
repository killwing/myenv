return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "go",
        "gomod",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader><space>",
          node_incremental = "<space>",
          scope_incremental = "<tab>",
          node_decremental = "<bs>",
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<F4>", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        max_width = 60,
        resize_to_content = true,
      },
    },
    keys = {
      { "<F5>", "<leader>cs", desc = "Aerial (Symbols)", remap = true },
    },
  },
}
