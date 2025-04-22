-- Colorschemes

return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function() end,
  },

  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    init = function() end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function() end,
  },

  {
    'sainnhe/edge',
    lazy = false,
    priority = 1000,
    init = function() end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    init = function() end,
  },

  {
    'marko-cerovac/material.nvim',
    name = 'material',
    priority = 1000,
    init = function() end,
  },

  {
    'p00f/alabaster.nvim',
    name = 'alabaster',
    priority = 1000,
    init = function() end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    name = 'gruvbox',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'gruvbox'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
