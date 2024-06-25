require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 60,
        relativenumber = true,
    },
    renderer = {
        group_empty = false,
        indent_markers = {
            enable = false,
        },
        icons = {
            glyphs = {
                git = {
                    unstaged = '',
                    staged = '',
                    unmerged = '',
                    renamed = '',
                    deleted = '',
                    untracked = '',
                    ignored = '',

                },
                folder = {
                    -- default = " ",
                    -- open = " ",
                    arrow_closed = "", -- arrow when folder is closed
                    arrow_open = "", -- arrow when folder is open
                },
            },
        },
    },
    filters = {
        dotfiles = false,
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_root = {
            enable = true,
            ignore_list = {},
        },
    },
})

vim.api.nvim_set_keymap('n', '<leader>nt', ':NvimTreeToggle<CR>', { noremap = true, silent = true, nowait = true })
