-- vim.opt.guicursor = ""

vim.opt.nu = true
-- vim.o.cmdheight=0
vim.opt.relativenumber = true

-- vim.opt.cursorline = true

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = false

-- vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

-- vim.diagnostic.config({
--   virtual_text = {
--     severity = {
--       min = vim.diagnostic.severity.WARN
--     },
--   },
--   signs = {
--     severity = {
--       min = vim.diagnostic.severity.WARN
--     },
--   },
--   underline = {
--     severity = {
--       min = vim.diagnostic.severity.WARN
--     },
--   },
--   severity_sort = true,
-- })

vim.diagnostic.config({ virtual_text = { prefix = '' }})

-- Optional: show line numbers
vim.opt.number = true

-- Disable automatic text wrapping by character count
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

-- Enable line wrapping
vim.opt.wrap = true

-- Optional: wrap at word boundaries instead of cutting words in half
vim.opt.linebreak = true

-- Move by displayed (visual) lines when wrapping
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- Enable spell check in markdown and text files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt.spell = true
    vim.opt.spelllang = { "en_us" }
  end,
})


vim.keymap.set("n", "<leader>sp", "z=", { noremap = true, silent = false })
