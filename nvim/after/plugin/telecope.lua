require("telescope").load_extension("live_grep_args")

local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', function()
    	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- vim.keymap.set('n', "<leader>lg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>lg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- open diagnostics window in telescope
vim.api.nvim_set_keymap('n', '<leader>pd', ':Telescope diagnostics<CR>', { noremap = true, silent = true })

-- open buffers window in telescope
vim.api.nvim_set_keymap('n', '<leader>pb', ':Telescope buffers<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<space>pv",
  ":Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>",
  { noremap = true, silent = true }
)

