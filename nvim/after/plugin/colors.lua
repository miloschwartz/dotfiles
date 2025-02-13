require('github-theme').setup({})

-- require('rose-pine').setup({
--     variant = 'rose-pine',
--     dim_inactive_windows = false,
--     extend_background_behind_borders = false,
--     disable_background = true,
--     disable_float_background = true,
--     enable = {
-- 	terminal = true,
-- 	legacy_highlights = true,
-- 	migrations = true,
--     },
--     styles = {
-- 	italic = false
--     },
-- })

-- require("catppuccin").setup({
--     flavour = "mocha",
--     no_bold = false,
--     no_italic = false,
--     integrations = {
--         nvimtree = false,
--     }
-- })

--
-- require("tokyonight").setup({
--   style = "night",
--   transparent = transparent,
--   styles = {
-- 	sidebars = transparent and "transparent" or "dark",
-- 	floats = transparent and "transparent" or "dark",
--   },
--   on_colors = function(colors)
-- 	colors.bg = bg
-- 	colors.bg_dark = transparent and colors.none or bg_dark
-- 	colors.bg_float = transparent and colors.none or bg_dark
-- 	colors.bg_highlight = bg_highlight
-- 	colors.bg_popup = bg_dark
-- 	colors.bg_search = bg_search
-- 	colors.bg_sidebar = transparent and colors.none or bg_dark
-- 	colors.bg_statusline = transparent and colors.none or bg_dark
-- 	colors.bg_visual = bg_visual
-- 	colors.border = border
-- 	colors.fg = fg
-- 	colors.fg_dark = fg_dark
-- 	colors.fg_float = fg
-- 	colors.fg_gutter = fg_gutter
-- 	colors.fg_sidebar = fg_dark
--   end,
-- })

-- require("gruvbox").setup({
--     overrides = {
--         SignColumn = {bg = "#282828"}
--     }
-- })

-- require("vague").setup({ })

-- require('vscode').setup({})

-- require("solarized-osaka").setup({
--   -- your configuration comes here
--   -- or leave it empty to use the default settings
--   transparent = true, -- Enable this to disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--   styles = {
--     -- Style to be applied to different syntax groups
--     -- Value is any valid attr-list value for `:help nvim_set_hl`
--     comments = { italic = true },
--     keywords = { italic = true },
--     functions = {},
--     variables = {},
--     -- Background styles. Can be "dark", "transparent" or "normal"
--     sidebars = "dark", -- style for sidebars, see below
--     floats = "dark", -- style for floating windows
--   },
--   sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--   day_brightness = 1, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--   hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--   dim_inactive = false, -- dims inactive windows
--   lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--
--   --- You can override specific color groups to use other groups or a hex color
--   --- function will be called with a ColorScheme table
--   on_colors = function(colors) end,
--
--   --- You can override specific highlights to use other groups or a hex color
--   --- function will be called with a Highlights and ColorScheme table
--   on_highlights = function(highlights, colors) end,
-- })

-- setup must be called before loading
-- vim.o.termguicolors = true
-- vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "rose-pine"
vim.cmd('colorscheme github_dark_default')

-- vim.cmd.colorscheme "gruvbox"
-- vim.cmd("colorscheme vscode")
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme solarized-osaka")
