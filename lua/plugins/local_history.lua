return {
  {
    "jiaoshijie/undotree",
    config = true,
    name = "undotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>U",
        "<cmd>lua require('undotree').toggle()<cr>",
        desc = "Local History",
      },
    },
  },
}
