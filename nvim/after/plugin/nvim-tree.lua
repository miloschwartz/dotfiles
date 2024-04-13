require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 40,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

vim.api.nvim_set_keymap('n', '<leader>bbf', ':NvimTreeToggle<CR>', { noremap = true, silent = true, nowait = true })
