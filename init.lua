-- INFO:
-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- INFO:
-- Define the highlight group
-- Create the autocmd for yank highlight
vim.api.nvim_command "highlight YankHighlight guibg=#f6c177 guifg=#000000"
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    local ns_id = vim.api.nvim_create_namespace "yank_highlight"
    local buf = vim.api.nvim_get_current_buf()
    local marks = vim.fn.getpos "'["
    local end_marks = vim.fn.getpos "']"

    -- INFO:
    -- Clear previous highlights
    -- Highlight the yanked region
    -- Clear the highlight after 0.25 seconds
    vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1)
    vim.api.nvim_buf_add_highlight(buf, ns_id, "YankHighlight", marks[2] - 1, marks[3] - 1, end_marks[3])
    vim.defer_fn(function() vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1) end, 250)
  end,
})

-- INFO:
-- Define a custom highlight group for visual mode
-- Ensure the custom highlight is applied when entering visual mode
vim.api.nvim_command "highlight Visual guibg=#393552"
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function() vim.api.nvim_set_hl(0, "Visual", { bg = "#393552" }) end,
})
