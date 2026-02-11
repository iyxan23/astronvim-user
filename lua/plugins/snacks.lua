-- snacks.nvim configuration to replace alpha-nvim in AstroNvim v5
return {
  "folke/snacks.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>"

        maps.n[prefix .. "fS"] = {
          function() Snacks.picker.lsp_workspace_symbols() end,
          desc = "Search workspace symbols",
        }
      end,
    },
  },
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          {
            icon = " ",
            key = ".",
            desc = "This Session",
            action = ":lua require('resession').load(vim.fn.getcwd(), { dir = 'dirsession' })",
          },
          { icon = " ", key = "l", desc = "Last Session", action = ":lua require('resession').load \"Last Session\"" },
          { icon = " ", key = "f", desc = "Find Session", action = ":lua require('resession').load()" },
          { icon = " ", key = "w", desc = "Find Word", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = table.concat({
          "            *@@@@@@@@@@%%%###***-",
          "           .@@@@@@@@@@@@@@@@@@%-",
          "           *@@@@@@@@@@@@@@@@*:",
          "   ___    :@@@@@@@@@@@@@@@*:____  _____ ",
          "  |_ _|   #@@@@@@@@@@@@@+. |___ \\|___ / ",
          "   | | | :@@@@@@@@@@@@+._ \\  __) | |_ \\ ",
          "   | | |_#@@@@@@@@@%=| | | |/ __/ ___) |",
          "  |___\\__@@@@@@@@%=_||_| |_|_____|____/ ",
          "      |_%@@@@@@%-",
          "       =@@@@@#-",
          "       %@@@#:",
          "      =@@*:",
          "      .@*.",
          "      ..",
        }, "\n"),
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },

      formats = {
        header = {
          "%s",
          -- function(item, tbl)
          --   local width = tbl.width
          --
          --   local header = {}
          --   local maxWidth = 0
          --   for _, line in ipairs(vim.split(item.val, "\n")) do
          --     if #line > maxWidth then maxWidth = #line end
          --     table.insert(header, line)
          --   end
          --
          --   local prependSpaces = (width / 2) - (maxWidth / 2)
          --
          --   for i, line in ipairs(header) do
          --     header[i] = string.rep(" ", prependSpaces) .. line
          --   end
          --
          --   return table.concat(header, "\n")
          -- end,
        },
      },
    },
    -- Configure other snacks modules that replace previous plugins
    picker = {
      -- telescope.nvim replacement configuration
      enabled = true,
      ui_select = true,
      focus = "list",
    },

    notify = {
      -- nvim-notify replacement configuration
    },

    indent = {
      -- indent-blankline.nvim replacement configuration
    },

    bufdelete = {
      -- mini.bufremove replacement configuration
    },
  },
}
