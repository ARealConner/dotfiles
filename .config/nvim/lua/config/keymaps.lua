-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

wk.register({
  c = {
    p = {
      name = "+codecompanion",
      t = { "<cmd>lua ToggleCodeCompanion()<cr>", "Toggle chat window" },
      T = { "<cmd>CodeCompanionToggle<cr>", "Base toggle window" },
      a = { "<cmd>CodeCompanionActions<cr>", "Open action palette" },
    },
  },
}, { prefix = "<leader>" })

wk.register({
  c = {
    p = {
      name = "+codecompanion",
      a = { "<cmd>CodeCompanionActions<cr>", "Open action palette" },
    },
  },
}, { prefix = "<leader>", mode = "v" })
