-- Runs the code in ./config/lazy.lua 
require("config.lazy")

-- Set up hybrid numbering
vim.o.number = true
vim.o.relativenumber = true

-- Configure tab sizing
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
