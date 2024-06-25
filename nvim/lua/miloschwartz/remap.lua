vim.g.mapleader = " "

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-c>", "<C-d>zz")
vim.keymap.set("n", "<C-x>", "<C-u>zz")
vim.keymap.set("n", "gd", "gdzz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.api.nvim_set_keymap('x', '<leader>x', '"+ygv"_d', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    })
})

-- Normal mode: Delete without affecting the yank buffer
vim.keymap.set('n', 'd', '"_d', { noremap = true, silent = true })
vim.keymap.set('n', 'D', '"_D', { noremap = true, silent = true })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true, silent = true })

-- Visual mode: Delete without affecting the yank buffer
vim.keymap.set('v', 'd', '"_d', { noremap = true, silent = true })
vim.keymap.set('v', 'D', '"_D', { noremap = true, silent = true })
vim.keymap.set('v', 'x', '"_x', { noremap = true, silent = true })

-- Optional: Remap other delete commands as needed in normal mode
vim.keymap.set('n', 'dw', '"_dw', { noremap = true, silent = true })
vim.keymap.set('n', 'db', '"_db', { noremap = true, silent = true })
vim.keymap.set('n', 'd$', '"_d$', { noremap = true, silent = true })
vim.keymap.set('n', 'd^', '"_d^', { noremap = true, silent = true })


-- Move to the left window with Ctrl-h
vim.keymap.set("n", "<leader>h", "<C-w>h")
-- Move to the down window with Ctrl-j
vim.keymap.set("n", "<leader>j", "<C-w>j")
-- Move to the up window with Ctrl-k
vim.keymap.set("n", "<leader>k", "<C-w>k")
-- Move to the right window with Ctrl-l
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Disable Ctrl-Z in normal mode
vim.keymap.set('n', '<C-z>', '<Nop>', {noremap = true, silent = true})

-- If you also want to disable it in insert mode, you can add:
vim.keymap.set('i', '<C-z>', '<Nop>', {noremap = true, silent = true})

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
  'n', '<leader>da', ':lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true, nowait=true}
)
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  'n', '<leader>dn', ':lua vim.diagnostic.goto_next()<CR>',
  { noremap = true, silent = true, nowait=true}
)
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  'n', '<leader>dp', ':lua vim.diagnostic.goto_prev()<CR>',
  { noremap = true, silent = true }
)

vim.cmd [[
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
]]

vim.api.nvim_set_keymap('n', '<Leader>fo', '<cmd>lua require("miloschwartz/fuzzy_oil").search_dirs_and_open_in_oil()<CR>', {noremap = true, silent = true, nowait=true})

-- Remap <C-y> to move the viewport up by one line while keeping the cursor in the same place
vim.api.nvim_set_keymap('n', '<C-n>', 'mz<C-y>`z', { noremap = true, silent = true })

-- Remap <C-e> to move the viewport down by one line while keeping the cursor in the same place
vim.api.nvim_set_keymap('n', '<C-m>', 'mz<C-e>`z', { noremap = true, silent = true })

