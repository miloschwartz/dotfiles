-- require('rose-pine').setup({
--     variant = 'auto',
--     disable_background = true,
-- })
-- 

-- function ColorMyPencils(color)
--     color = color or "rose-pine"
--     vim.cmd.colorscheme(color)
-- end
-- 
-- ColorMyPencils()

require("catppuccin").setup({
    flavour = "mocha",
})

-- setup must be called before loading
vim.o.termguicolors = true
vim.cmd.colorscheme "catppuccin"
