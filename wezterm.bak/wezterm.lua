-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme_dirs = { "~/Documents/terminal_schemes/" }
config.font_dirs = { "~/Library/Fonts" }

-- For example, changing the color scheme:
config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = '#575757',
	},
	foreground = "#dbdbdb",
	background = "#171a1e",
	cursor_bg = "#ffffff",
	cursor_border = "#ffffff",
	cursor_fg = "#000000",
	selection_bg = "#b3d7ff",
	selection_fg = "#000000",
	ansi = { "#14191e", "#b43c2a", "#7bea7b", "#ece110", "#2744c7", "#bf58be", "#00c5c7", "#c7c7c7" },
	brights = { "#676767", "#dc7974", "#57e690", "#ece100", "#a6aaf1", "#e07de0", "#8de5e6", "#feffff" },
	-- foreground = "#839496",
	-- background = "#002b36",
	-- cursor_bg = "#839496",
	-- cursor_border = "#839496",
	-- cursor_fg = "#073642",
	-- selection_bg = "#073642",
	-- selection_fg = "#93a1a1",

	-- ansi = { "#073642", "#dc322f", "#859900", "#b58900", "#268bd2", "#d33682", "#2aa198", "#eee8d5" },
	-- brights = { "#002b36", "#cb4b16", "#586e75", "#657b83", "#839496", "#6c71c4", "#93a1a1", "#fdf6e3" }
}
config.bold_brightens_ansi_colors = true

-- Tab bar
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 8
config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font { family = 'FiraCode Nerd Font', scale = 1 },

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 12.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = '#333333',

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = '#132333',
}

-- config.colors = {
-- 	tab_bar = {
-- 		-- The color of the inactive tab bar edge/divider
-- 		inactive_tab_edge = '#575757',
-- 	},
-- }

-- Fonts
config.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono", scale = 1},
	{ family = "FiraCode Nerd Font", scale = 1 }
})
config.font_size = 18.0

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane

	local index = ""
	if #tabs > 1 then
		index = string.format("%d: ", tab.tab_index + 1)
	end

	local process = basename(pane.foreground_process_name)

	return { {
		Text = ' ' .. index .. process .. ' '
	} }
end)

-- keys
config.disable_default_key_bindings = false
config.keys = {
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
}



-- and finally, return the configuration to wezterm
return config
