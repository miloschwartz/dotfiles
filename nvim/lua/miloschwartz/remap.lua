vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-c>", "<C-d>zz")
vim.keymap.set("n", "<C-x>", "<C-u>zz")
vim.keymap.set("n", "gd", "gdzz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.api.nvim_set_keymap('x', '<leader>c', '"+ygv"_d', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- escape terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>f", ":Neoformat<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

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

local function find_git_root()
    local git_root = vim.fn.systemlist("git -C " .. vim.fn.expand('%:p:h') .. " rev-parse --show-toplevel")[1]
    if vim.v.shell_error ~= 0 then
        return nil  -- or return vim.fn.getcwd() if you want to fallback to current working directory
    end
    return git_root
end

-- Function to replace home directory with tilde
local function replace_home_dir_with_tilde(path)
    local home_dir = os.getenv("HOME")
    if vim.startswith(path, home_dir) then
        return path:gsub("^" .. home_dir, "~")
    end
    return path
end

-- Copy the relative path including the file name to the clipboard
vim.keymap.set("n", "<leader>cf", function()
    local git_root = find_git_root()
    if git_root then
        local relative_path_with_file = vim.fn.expand('%:p'):sub(#git_root + 2)
        vim.fn.setreg('+', relative_path_with_file)
        print("Copied relative path (with file): " .. relative_path_with_file)
    else
        print("Not inside a Git repository")
    end
end)

-- Copy the relative directory path to the clipboard
vim.keymap.set("n", "<leader>cp", function()
    local git_root = find_git_root()
    if git_root then
        local relative_dir_path = vim.fn.expand('%:p:h'):sub(#git_root + 2)
        vim.fn.setreg('+', relative_dir_path)
        print("Copied relative directory path: " .. relative_dir_path)
    else
        print("Not inside a Git repository")
    end
end)

-- Copy the absolute path including the file name to the clipboard
vim.keymap.set("n", "<leader>caf", function()
    local full_path = replace_home_dir_with_tilde(vim.fn.expand('%:p'))
    vim.fn.setreg('+', full_path)
    print("Copied absolute path (with file): " .. full_path)
end)

-- Copy the absolute directory path to the clipboard
vim.keymap.set("n", "<leader>cap", function()
    local dir_path = replace_home_dir_with_tilde(vim.fn.expand('%:p:h'))
    vim.fn.setreg('+', dir_path)
    print("Copied absolute directory path: " .. dir_path)
end)

-- Disable Ctrl-Z in normal mode
vim.keymap.set('n', '<C-z>', '<Nop>', {noremap = true, silent = true})

-- If you also want to disable it in insert mode, you can add:
vim.keymap.set('i', '<C-z>', '<Nop>', {noremap = true, silent = true})
