require("neo-tree").setup({
    close_if_last_window = true,
    use_popups_for_input = false,
    default_component_configs = {
        container = {
            enable_character_fade = false
        },
        indent = {
            indent_size = 2,
            with_markers = false,
        },
    },
    -- event_handlers = {
    --     {
    --         event = "file_opened",
    --         handler = function(file_path)
    --             -- auto close
    --             -- vimc.cmd("Neotree close")
    --             -- OR
    --             require("neo-tree.command").execute({ action = "close" })
    --         end
    --     },
    --
    -- },
    window = {
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        position = "left",
        width = 40,
        mappings = {
            ["J"] = function(state)
                local tree = state.tree
                local node = tree:get_node()
                local siblings = tree:get_nodes(node:get_parent_id())
                local renderer = require('neo-tree.ui.renderer')
                renderer.focus_node(state, siblings[#siblings]:get_id())
            end,
            ["K"] = function(state)
                local tree = state.tree
                local node = tree:get_node()
                local siblings = tree:get_nodes(node:get_parent_id())
                local renderer = require('neo-tree.ui.renderer')
                renderer.focus_node(state, siblings[1]:get_id())
            end,
            ["m"] = {
                "move",
                config = {
                    show_path = "relative" -- "none", "relative", "absolute"
                }
            },
        }
    },
    filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db"
        },
    }
}
})

-- vim.api.nvim_set_keymap('n', '<leader>bf', ':Neotree toggle<CR>', { noremap = true, silent = true, nowait = true })
