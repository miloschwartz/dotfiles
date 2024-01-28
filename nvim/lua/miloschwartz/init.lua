require("miloschwartz.remap")
require("miloschwartz.set")

-- vim.api.nvim_exec([[
--   augroup fmt
--     autocmd!
--     autocmd BufWritePre * undojoin | Neoformat 
--   augroup END
-- ]], false)

vim.cmd('autocmd BufEnter * set formatoptions-=cro')

-- Set fill characters for folds
vim.opt.fillchars = { fold = " " }

-- Use indentation for folding
vim.opt.foldmethod = "indent"

-- Disable automatic folding when opening a file
vim.opt.foldenable = false

-- Set a high fold level to ensure all folds are open by default
vim.opt.foldlevel = 99

-- Enable Markdown folding
vim.g.markdown_folding = 1

-- Create a directory for undo files
local undodir = vim.fn.expand('~/.undo')

-- Check if the directory exists, if not create it
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
end

-- Set up the undo directory
vim.opt.undodir = undodir

-- Enable persistent undo
vim.opt.undofile = true
