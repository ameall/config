-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.clipboard = unnamedplus

require 'include.visual'
require 'include.general'
require 'include.keymaps'
require 'include.plugins'
