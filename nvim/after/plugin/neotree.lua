require("neo-tree").setup({
    close_if_last_window = false,
    default_component_configs = {
        container = {
            enable_character_fade = false
        },
        indent = {
            indent_size = 2,
            with_markers = false,
        },
    },
    window = {
        position = "left",
        width = 40,
    },
    filesystem = {
        follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
    }
})

vim.api.nvim_set_keymap('n', '<leader>t', ':Neotree toggle<CR>', { noremap = true, silent = true })
