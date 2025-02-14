require("obsidian").setup({
	workspaces = {
		{
			name = "vault",
			path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault",
		},
	},
	ui = {
		enable = false,
	},
})

vim.keymap.set("n", "<leader>no", ":ObsidianOpen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nn", ":ObsidianNew<CR>", { noremap = true, silent = true })
