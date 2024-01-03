require("terminal").setup({
    layout = { open_cmd = "botright new" },
    cmd = { vim.o.shell },
    autoclose = false,
})

vim.api.nvim_create_user_command("TermCurrentPath", function()
    local current_path = vim.fn.expand('%:p:h')
    local Terminal = require("terminal").terminal
    local term = Terminal:new({ cwd = current_path })
    term:toggle()
end, {})

vim.api.nvim_create_user_command("TermProjectRoot", function()
    local handle = io.popen("git rev-parse --show-toplevel 2> /dev/null")
    local result = handle:read("*a")
    handle:close()

    local path = result:match("^%s*(.-)%s*$")  -- Trim whitespace
    if path == "" then path = vim.fn.expand('~') end  -- Fallback to home if not in a git repo

    local Terminal = require("terminal").terminal
    local term = Terminal:new({ cwd = path })
    term:toggle()
end, {})

vim.keymap.set("n", "<leader>to", ":TermCurrentPath<CR>")
vim.keymap.set("n", "<leader>tr", ":TermProjectRoot<CR>")
