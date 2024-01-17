local lspsig = require("lsp_signature")

lspsig.setup({
    hint_prefix = "",
    hint_enable = false,
    fix_pos = true,
})

vim.keymap.set({ 'n' }, '<C-k>', function()  lspsig.toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })
