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
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
	                                                                     
	       ████ ██████           █████      ██                     
	      ███████████             █████                             
	      █████████ ███████████████████ ███   ███████████   
	     █████████  ███    █████████████ █████ ██████████████   
	    █████████ ██████████ █████████ █████ █████ ████ █████   
	  ███████████ ███    ███ █████████ █████ █████ ████ █████  
	 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope projects",                                       desc = " Projects",        icon = " ", key = "p" },
          { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
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
    -- https://github.com/ahmedkhalf/project.nvim/issues/61#issuecomment-1104697236
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
      patterns = { ".git" },
      detection_methods = { "pattern" },
      silent_chdir = true,
      show_hidden = true,
    },
  },
}
