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
    'yorickpeterse/vim-paper',
    name = 'paper',
    priority = 1000,
    init = function() end,
  },

  {
    'yorickpeterse/nvim-grey',
    name = 'grey',
    priority = 1000,
    init = function() end,
  },

  {
    'mcchrish/vim-no-color-collections',
    name = 'no-color',
    priority = 1000,
    init = function() end,
  },

  {
    'e-ink-colorscheme/e-ink.nvim',
    name = 'e-ink',
    priority = 1000,
    init = function() end,
  },

  {
    'kdheepak/monochrome.nvim',
    name = 'monochrome',
    priority = 1000,
    init = function() end,
  },

  {
    'huyvohcmc/atlas.vim',
    name = 'atlas',
    priority = 1000,
    init = function() end,
  },

  {
    'vim-scripts/zenesque.vim',
    name = 'zenesque',
    priority = 1000,
    init = function() end,
  },

  {
    'aditya-azad/candle-grey',
    name = 'candle-grey',
    priority = 1000,
    init = function() end,
  },

  {
    'ntk148v/komau.vim',
    name = 'komau',
    priority = 1000,
    init = function() end,
  },

  {
    'pbrisbin/vim-colors-off',
    name = 'colors-off',
    priority = 1000,
    init = function() end,
  },

  {
    'andreypopp/vim-colors-plain',
    name = 'colors-plain',
    priority = 1000,
    init = function() end,
  },

  {
    'jaredgorski/fogbell.vim',
    name = 'fogbell',
    priority = 1000,
    init = function() end,
  },

  {
    'nikolvs/vim-sunbather',
    name = 'sunbather',
    priority = 1000,
    init = function() end,
  },

  {
    'hardselius/warlock',
    name = 'sunbather',
    priority = 1000,
    init = function() end,
  },

  {
    'slugbyte/lackluster.nvim',
    name = 'sunbather',
    priority = 1000,
    init = function() end,
  },

  {
    'maxmx03/solarized.nvim',
    name = 'solarized1',
    priority = 1000,
    init = function() end,
  },

  {
    'lifepillar/vim-solarized8',
    name = 'solarized8',
    priority = 1000,
    init = function() end,
  },

  {
    'shaunsingh/solarized.nvim',
    name = 'solarized2',
    priority = 1000,
    init = function() end,
  },

  {
    'wnkz/monoglow.nvim',
    name = 'monoglow',
    priority = 1000,
    config = function()
      require('monoglow').setup {
        on_colors = function(colors)
          colors.glow = '#fd1b7c' -- Change this to your desired glow color
        end,
      }
    end,
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
