local tele = require("telescope")

tele.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-S-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
                ["<C-S-w>"] = require("telescope.actions").send_to_qflist,
                ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
            }
        },
		file_ignore_patterns = {
		  "node_modules/",
		  ".git/"
		}
    },
	pickers = {
		find_files = {
			hidden = true
		}
	}
})

tele.load_extension("live_grep_args")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- vim.keymap.set('n', "<leader>lg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>lg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- open diagnostics window in telescope
vim.api.nvim_set_keymap('n', '<leader>fd', ':Telescope diagnostics<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<space>fv",
  ":Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>",
  { noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume", })
vim.keymap.set("n", "<leader>lr", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume", })
