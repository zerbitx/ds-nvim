local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "R", function() vim.cmd.RustLsp { "runnables" } end)
