-- Documentation generator

return {
  'danymat/neogen',
  cmd = 'Neogen',
  opts = {},
  vim.keymap.set('n', '<Leader>nf', '<CMD>Neogen<CR>', { desc = 'Generate Doxygen Documentation' }),
  config = function()
    require('neogen').setup {}
  end,
}
