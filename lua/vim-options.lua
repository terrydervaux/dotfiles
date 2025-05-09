vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- system keyboard into P
vim.opt.clipboard = "unnamedplus"

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.guifont = "Source Code Pro:h12:#h-slight"

-- quick fix navigation
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- line display
vim.o.number = true         -- show line numbers
vim.o.relativenumber = true -- show line numbers
vim.o.cursorline = true     -- highlight current line

-- colomn display
vim.opt.colorcolumn = "80"

-- vsidl treated as proto files
vim.filetype.add({
  extension = {
    vsidl = "proto",
  },
})
