local M = {}

local telescope = require('telescope')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- Custom function to open the selected file with 'oil.open'
local function open_with_oil(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    actions.close(prompt_bufnr)
    local file_path = selection.value
    local dir_path = vim.fn.fnamemodify(file_path, ':h')  -- Get the directory containing the file
    -- Make sure that your 'oil' module and 'open' function are correctly defined
    require('oil').open(dir_path)
end

function M.search_dirs_and_open_in_oil()
    telescope.setup{}

    -- Define the picker
    require('telescope.builtin').find_files({
        prompt_title = "Open in Oil",
        cwd = vim.loop.cwd(), -- Start search from the Neovim's working directory

        -- Attach custom function to the default selection action
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                print("Selected")
                open_with_oil(prompt_bufnr)
            end)
            return true
        end,
    })
end

return M

