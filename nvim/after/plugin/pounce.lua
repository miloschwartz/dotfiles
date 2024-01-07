local pounce = require('pounce')
vim.keymap.set("n", "s", function() pounce.pounce { } end)
vim.keymap.set("n", "S", function() pounce.pounce { do_repeat = true } end)
