if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function() vim.g.codeium_disable_bindings = true end,
}
