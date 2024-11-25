local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.font = wezterm.font("BlexMono Nerd Font Mono")
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 20

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

config.colors = theme.colors()

-- config.colors.background = "#000000"

config.window_padding = {
	left = 0,
	right = 0,
	top = 12,
	bottom = 0,
}


return config
