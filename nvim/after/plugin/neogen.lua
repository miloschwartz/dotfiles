local neogen = require("neogen")

neogen.setup({})

vim.keymap.set("n", "<leader>df", function()
    neogen.generate({ type = "func" })
end)
