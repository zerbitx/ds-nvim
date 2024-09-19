return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle",                         -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = { enabled = true },
  -- keys = {
    -- { "<leader>n", ":ASToggle<CR>", desc = "Toggle auto-save" },
  -- },
}
