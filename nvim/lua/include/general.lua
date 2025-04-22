-- General Config --

-- Sync nvim clipboard with OS clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Search
vim.opt.ignorecase = true -- Case insensitive when only lowercase letters are used
vim.opt.smartcase = true -- If uppercase letters are present, not case sensitive

vim.opt.undofile = true -- Save undo history

vim.opt.updatetime = 250 -- Decrease swap file update time
vim.opt.timeoutlen = 250 -- Decrease mapped sequence wait time; displays which-key popup sooner
