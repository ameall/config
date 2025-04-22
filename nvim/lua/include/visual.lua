-- GUI things --

vim.opt.showmode = false -- Don't show mode since it's already in the status line

-- Cursor behavior
vim.opt.cursorline = true -- Show which line the cursor is on
vim.opt.mouse = 'a' -- Enable mouse mode
vim.opt.scrolloff = 10 -- Minimum number of screen lines to keep above and below the cursor
vim.opt.number = true -- Show line number of current line
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.inccommand = 'split' -- Preview substitutions in live time

-- Indent and folding
vim.opt.foldmethod = 'indent' -- Set code folding based on indentation level
vim.opt.foldlevelstart = 99 -- Start nvim with code fully unfolded
vim.opt.breakindent = true -- Consecutive lines will have same indent level

-- Colors
vim.opt.termguicolors = true -- Fix tmux color issues
vim.cmd [[ set termguicolors ]] -- Apply colors
vim.cmd [[ set background=dark ]] -- Set default background theme as dark
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]] -- Set transparent background on start

-- Tab behavior
vim.opt.tabstop = 4 -- Make TAB characters appear 4 spaces wide
vim.opt.expandtab = true -- Pressing TAB will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Misc GUI items
vim.opt.signcolumn = 'yes' -- Enable sign column
vim.cmd [[ set colorcolumn=80 ]] -- Vertical line
vim.opt.list = true -- Show whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Whitespace character indicators

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
