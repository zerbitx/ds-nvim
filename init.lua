-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo(
    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
    true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

local telescope_builtin = require "telescope.builtin"
vim.keymap.set("n", "<C-p>", telescope_builtin.find_files, {})
vim.cmd("let g:loaded_clipboard_provider = 1")

local vim_set_commands = {
  "expandtab",
  "tabstop=2",
  "softtabstop=2",
  "shiftwidth=2",
  "number",
}

for _, cmd in ipairs(vim_set_commands) do
  vim.cmd("set " .. cmd)
end

local function should_autosave()
  -- Retrieve the buffer type; avoid saving for non-file buffers like tree viewers, terminal, etc.
  local buftype = vim.api.nvim_buf_get_option(0, "buftype")
  return buftype == "" or buftype == "file"
end

-- Save the current buffer with a delay
local function delayed_save()
  vim.defer_fn(function()
    if should_autosave() then vim.cmd "write" end
  end, 1500) -- Delay in milliseconds
end

-- Create the autocmd using Neovim's API
vim.api.nvim_create_autocmd("FocusLost", {
  pattern = "*", -- Apply to all buffers
  callback = delayed_save,
})
