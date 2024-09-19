return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  keys = {
    { "<leader>O", ":Oil<CR>", desc = "Open Oil"}
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} }, { "nvim-tree/nvim-web-devicons" } },
  -- dependencies = , -- use if prefer nvim-web-devicons
}
