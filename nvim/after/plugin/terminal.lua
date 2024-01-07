-- Function for dynamic terminal split
local function dynamic_terminal_split()
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    if width > 3*height then
        return "botright vsplit"
    else
        return "botright split"
    end
end

-- Setup terminal.nvim
require("terminal").setup({
    layout = { open_cmd = dynamic_terminal_split() .. " new" },
    cmd = { vim.o.shell },
    autoclose = false,
})

-- User command for opening terminal in current file's directory
vim.api.nvim_create_user_command("TermCurrentPath", function()
    local current_path = vim.fn.expand('%:p:h')
    local Terminal = require("terminal").terminal
    local term = Terminal:new({ cwd = current_path, layout = { open_cmd = dynamic_terminal_split() .. " new" } })
    term:toggle()
end, {})

-- User command for opening terminal in project's root directory
vim.api.nvim_create_user_command("TermProjectRoot", function()
    local handle = io.popen("git rev-parse --show-toplevel 2> /dev/null")
    local result = handle:read("*a")
    handle:close()

    local path = result:match("^%s*(.-)%s*$")  -- Trim whitespace
    if path == "" then path = vim.fn.expand('~') end  -- Fallback to home if not in a git repo

    local Terminal = require("terminal").terminal
    local term = Terminal:new({ cwd = path, layout = { open_cmd = dynamic_terminal_split() .. " new" } })
    term:toggle()
end, {})

-- Key mappings to open terminals
vim.keymap.set("n", "<leader>to", ":TermCurrentPath<CR>")
vim.keymap.set("n", "<leader>tr", ":TermProjectRoot<CR>")
