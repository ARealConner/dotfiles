return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    {
      "stevearc/dressing.nvim",
      opts = {},
    },
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        openai = require("codecompanion.adapters").use("openai", {
          schema = {
            model = {
              default = "gpt-4-turbo-2024-04-09",
            },
          },
        }),
      },
      strategies = {
        chat = "openai",
        inline = "openai",
      },
      display = {
        chat = { -- Options for the chat strategy
          type = "buffer", -- float|buffer
          show_settings = true, -- Show the model settings in the chat buffer?
          show_token_count = true, -- Show the token count for the current chat in the buffer?
          buf_options = { -- Buffer options for the chat buffer
            buflisted = false,
          },
          win_options = { -- Window options for the chat buffer
            cursorcolumn = false, -- Default: false
            cursorline = false, -- Default: false
            foldcolumn = "0", -- Default: 0
            linebreak = true, -- Default: true
            list = false, -- Default: false
            signcolumn = "no", -- Default: no
            spell = false, -- Default: false
            wrap = true, -- Default: false
          },
        },
      },
    })
  end,
}
