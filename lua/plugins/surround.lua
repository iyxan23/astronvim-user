return {
  "kylechui/nvim-surround",
  version = "^4.0.0",
  event = "VeryLazy",
  init = function()
    vim.g.nvim_surround_no_insert_mappings = true
    vim.g.nvim_surround_no_normal_mappings = true
    vim.g.nvim_surround_no_visual_mappings = true
  end,
  config = function()
    -- migrate to v4
    vim.keymap.set("n", ",", "<Plug>(nvim-surround-normal)", { desc = "Add surrounding pair (normal)" })
    vim.keymap.set("x", ",", "<Plug>(nvim-surround-visual)", { desc = "Add surrounding pair (visual)" })
    vim.keymap.set("n", "d,", "<Plug>(nvim-surround-delete)", { desc = "Delete surrounding pair" })
    vim.keymap.set("n", "c,", "<Plug>(nvim-surround-change)", { desc = "Change surrounding pair" })

    require("nvim-surround").setup {
      surrounds = {
        -- react fragment
        ["e"] = {
          add = { "<>", "</>" },
          find = function() return require("nvim-surround.config").get_selection { pattern = "<()>.-()</>" } end,
          delete = "^(<>)().-(</>)()$",
          change = {
            target = "^<>()().-()</>$",
            replacement = function() return { { "<>" }, { "</>" } } end,
          },
        },

        -- js template literal string escape
        ["j"] = {
          add = { "${", "}" },
          find = "${[%w_]+}",
          delete = "^(%${)().-()(%})$",
          change = {
            target = "^%${().-()%}$",
          },
        },

        -- thanks: https://github.com/kylechui/nvim-surround/discussions/53#discussioncomment-10070567
        ["t"] = {
          add = function()
            local input = vim.fn.input "Emmet Abbreviation: "

            if input then
              local bufnr = 0
              local client = unpack(vim.lsp.get_clients { bufnr = bufnr, name = "emmet_language_server" })
              if client then
                local splitter = "BENNYSPECIALSECRETSTRING"
                local response = client.request_sync("emmet/expandAbbreviation", {
                  abbreviation = input,
                  language = vim.opt.filetype,
                  options = {
                    text = splitter,
                  },
                }, 50, bufnr)
                if response then
                  if response.err then
                    vim.notify(response.err.message)
                  else
                    return (vim.split(response.result, splitter))
                  end
                end
              end
            end
          end,
          find = function() return require("nvim-surround.config").get_selection { motion = "at" } end,
          delete = "^(%b<>)().-(%b<>)()$",
          change = {
            target = "^<([^%s<>]*)().-([^/]*)()>$",
            replacement = function()
              local input = vim.fn.input "New Emmet Abbreviation: "
              if input then
                local element = input:match "^<?([^%s>]*)"
                local attributes = input:match "^<?[^%s>]*%s+(.-)>?$"

                local open = attributes and element .. " " .. attributes or element
                local close = element

                return { { open }, { close } }
              end
            end,
          },
        },
      },
    }
  end,
}
