local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = false,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = false,
                parameterNames = false,
                rangeVariableTypes = false,
              },
            },
          },
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
      },
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
      { "<leader>k", "<leader>cs", desc = "Aerial (Symbols)", remap = true },
    },
  },
  {
    -- https://github.com/nvim-telescope/telescope.nvim/issues/2014#issuecomment-1873547633
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        buffers = {
          path_display = filenameFirst,
        },
        find_files = {
          path_display = filenameFirst,
        },
        git_files = {
          path_display = filenameFirst,
        },
      },
    },
  },
  {
    -- https://github.com/folke/flash.nvim/issues/6#issuecomment-1613180051
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          autohide = function()
            -- autohide flash when the operator is `y` or `d`
            return vim.fn.mode(true):find("no") and (vim.v.operator == "y" or vim.v.operator == "d")
          end,
        },
      },
    },
  },
  {
    "echasnovski/mini.map",
    config = function()
      local map = require("mini.map")
      map.setup({
        symbols = {
          encode = map.gen_encode_symbols.dot("4x2"),
        },
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.gitsigns(),
          map.gen_integration.diagnostic({
            error = "DiagnosticFloatingError",
            warn = "DiagnosticFloatingWarn",
            info = "DiagnosticFloatingInfo",
            hint = "DiagnosticFloatingHint",
          }),
        },
        window = {
          width = 15,
          focusable = true,
        },
      })
    end,
    keys = {
      {
        "<Leader>mt",
        function()
          require("mini.map").toggle()
        end,
        desc = "MiniMap",
      },
    },
  },
  {
    "Bekaboo/dropbar.nvim",
  },
}
