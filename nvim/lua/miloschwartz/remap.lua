vim.g.mapleader = " "

-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "gd", "gdzz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- vim.keymap.set({ "n", "v" }, "y", [["+y]])

-- Remap 'y' to copy to the system clipboard
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })

-- Remap 'p' to paste from the system clipboard
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true, silent = true })
vim.keymap.set('x', 'x', '"+ygv"_d', { noremap = true, silent = true })

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
vim.keymap.set('n', 'dd', '"_dd', { noremap = true, silent = true })

-- Visual mode: Delete without affecting the yank buffer
vim.keymap.set('v', 'd', '"_d', { noremap = true, silent = true })
vim.keymap.set('v', 'D', '"_D', { noremap = true, silent = true })

-- Optional: Remap other delete commands as needed in normal mode
vim.keymap.set('n', 'dw', '"_dw', { noremap = true, silent = true })
vim.keymap.set('n', 'db', '"_db', { noremap = true, silent = true })
vim.keymap.set('n', 'd$', '"_d$', { noremap = true, silent = true })
vim.keymap.set('n', 'd^', '"_d^', { noremap = true, silent = true })


-- Move to the left window with Ctrl-h
vim.keymap.set("n", "<leader>h", "<C-w>h", { nowait=true })
-- Move to the down window with Ctrl-j
vim.keymap.set("n", "<leader>j", "<C-w>j", { nowait=true })
-- Move to the up window with Ctrl-k
vim.keymap.set("n", "<leader>k", "<C-w>k", { nowait=true })
-- Move to the right window with Ctrl-l
vim.keymap.set("n", "<leader>l", "<C-w>l", { nowait=true })

-- Disable Ctrl-Z in normal mode
vim.keymap.set('n', '<C-z>', '<Nop>', {noremap = true, silent = true})

-- If you also want to disable it in insert mode, you can add:
vim.keymap.set('i', '<C-z>', '<Nop>', {noremap = true, silent = true})

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
  'n', '<leader>da', ':lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true, nowait=true}
)

-- Go to next diagnostic with severity error
vim.api.nvim_set_keymap(
  'n', '<leader>dn',
  ':lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>',
  { noremap = true, silent = true, nowait = true }
)

-- Go to previous diagnostic with severity error
vim.api.nvim_set_keymap(
  'n', '<leader>dp',
  ':lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>',
  { noremap = true, silent = true }
)

vim.cmd [[
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
]]

vim.api.nvim_set_keymap('n', '<Leader>fo', '<cmd>lua require("miloschwartz/fuzzy_oil").search_dirs_and_open_in_oil()<CR>', {noremap = true, silent = true, nowait=true})

-- Remap <C-y> to move the viewport up by one line while keeping the cursor in the same place
-- vim.api.nvim_set_keymap('n', '<C-n>', 'mz<C-y>`z', { noremap = true, silent = true })

-- Remap <C-e> to move the viewport down by one line while keeping the cursor in the same place
-- vim.api.nvim_set_keymap('n', '<C-m>', 'mz<C-e>`z', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-n>', ':cnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-m>', ':cprev<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<S-8>', ':let @/ = "\\<<C-r><C-w>\\>"<cr>:set hlsearch<cr>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>qfd", function()
    -- Get all diagnostics in the current buffer
    local diagnostics = vim.diagnostic.get(0) -- 0 means current buffer
    local qf_list = {}
    
    -- Filter and convert diagnostics to quickfix list format
    for _, diag in ipairs(diagnostics) do
        if diag.severity == vim.diagnostic.severity.ERROR then
            table.insert(qf_list, {
                bufnr = diag.bufnr,
                lnum = diag.lnum + 1,  -- Line numbers in quickfix are 1-based
                col = diag.col + 1,    -- Columns in quickfix are 1-based
                text = diag.message,
                type = "E",            -- 'E' for error
            })
        end
    end

    -- Set the quickfix list and open it
    vim.fn.setqflist(qf_list, "r") -- 'r' replaces the current list
    vim.cmd("copen")
end, { desc = "Put only errors in the current buffer into the quickfix list" })
