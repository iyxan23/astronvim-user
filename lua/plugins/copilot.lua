return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "User AstroFile",
  opts = {
    copilot_node_command = vim.fn.expand("$HOME/.local/share/fnm/current/bin/node"),
    suggestion = {
      auto_trigger = true,
      debounce = 150
    }
  },
}
