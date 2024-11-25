require('lualine').setup {
	options = {
		theme = "auto",
		icons_enabled = true,
		section_separators = '',
		component_separators = '',
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
	},
	extensions = { "nvim-tree", "oil" },
	sections = {
		lualine_a = {
			{ 'mode', color = { gui = 'bold' } },
		},
		lualine_b = {'branch'},
		lualine_c = {'filename', {
			'diff',
			-- Is it me or the symbol for modified us really weird
			symbols = { added = ' ', modified = ' ', removed = ' ' },
		}},
		lualine_x = {{
			'diagnostics',
			sources = { 'nvim_diagnostic' },
			symbols = { error = ' ', warn = ' ', info = ' ', hint = '󱠂 ' },
		},'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
}

-- local colors = require("solarized-osaka.colors").setup()
-- local background_color = colors.base03
-- local grey = colors.base01
-- local white = colors.base0
-- local pink = colors.magenta500
-- local dark = colors.base04
-- vim.api.nvim_set_hl(0, "HarpoonInactive", { fg = grey, bg = background_color })
-- vim.api.nvim_set_hl(0, "HarpoonActive", { fg = dark, bg = pink })
-- vim.api.nvim_set_hl(0, "HarpoonNumberActive", { fg = dark, bg = pink })
-- vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { fg = grey, bg = background_color })
-- vim.api.nvim_set_hl(0, "TabLineFill", { fg = "white", bg = background_color })
--
-- local harpoon = require('harpoon')
--
-- function Harpoon_files()
-- 	local contents = {}
-- 	local marks_length = harpoon:list():length()
-- 	local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
-- 	for index = 1, marks_length do
-- 		local harpoon_file_path = harpoon:list():get(index).value
--
-- 		local label = ""
-- 		if vim.startswith(harpoon_file_path, "oil") then
-- 			local dir_path = string.sub(harpoon_file_path, 7)
-- 			dir_path = vim.fn.fnamemodify(dir_path, ":.")
-- 			label = '[' .. dir_path .. ']'
-- 		elseif harpoon_file_path ~= "" then
-- 			label = vim.fn.fnamemodify(harpoon_file_path, ":t")
-- 		end
--
-- 		label = label ~= "" and label or "(empty)"
-- 		if current_file_path == harpoon_file_path then
-- 			contents[index] = string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index, label)
-- 		else
-- 			contents[index] = string.format("%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ", index, label)
-- 		end
-- 	end
--
-- 	return table.concat(contents)
-- end
--
-- require('lualine').setup {
-- 	tabline = {
-- 		lualine_a = { { Harpoon_files } },
-- 	},
-- }
