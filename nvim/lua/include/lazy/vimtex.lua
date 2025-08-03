-- LaTeX previews

return {
  {
    'lervag/vimtex',
    ft = 'tex',
    init = function()
      vim.cmd [[
        filetype plugin indent on
        syntax enable
      ]]
      vim.g.vimtex_view_general_viewer = 'evince'
    end,
  },
}
