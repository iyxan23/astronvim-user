if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- blink.cmp configuration to replace nvim-cmp in AstroNvim v5
return {
  "Saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        draw = {
          columns = {
            -- customize the completion menu columns layout
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
          },
        },
      },
    },
    -- add any other blink.cmp configurations here
    -- this maintains the same basic functionality as the default nvim-cmp setup
  },
}
