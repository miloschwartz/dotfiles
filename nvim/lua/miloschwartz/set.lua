-- vim.opt.guicursor = ""

vim.opt.nu = true
-- vim.o.cmdheight=0
vim.opt.relativenumber = true

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = false
--
-- vim.opt.smartindent = true

vim.opt.expandtab = false   -- Use tabs instead of spaces
vim.opt.tabstop = 4         -- A tab is shown as 4 spaces width
vim.opt.shiftwidth = 4      -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 4

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.diagnostic.config({
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.WARN
    },
  },
  signs = {
    severity = {
      min = vim.diagnostic.severity.WARN
    },
  },
  underline = {
    severity = {
      min = vim.diagnostic.severity.WARN
    },
  },
  severity_sort = true,
})

-- vim.diagnostic.config({ virtual_text = { prefix = '' }})
