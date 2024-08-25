vim.api.nvim_set_keymap('n', '<C-h>', ':<C-U>TmuxNavigateLeft<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':<C-U>TmuxNavigateDown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':<C-U>TmuxNavigateUp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':<C-U>TmuxNavigateRight<CR>', { noremap = true, silent = true })
