-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 190
config.initial_rows = 50

-- or, changing the font size and color scheme.
config.font = wezterm.font('UDEV Gothic 35JPDOC')
config.font_size = 13
config.use_ime = true
config.color_scheme = 'Dracula+'
config.default_cursor_style = 'SteadyBlock'
-- IMEでの変換時にCtrl-HするとWezTermにキー入力が食われる
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'
config.window_close_confirmation = 'NeverPrompt'


-- change active tab bar
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
 local background = "#5c6d74"
 local foreground = "#FFFFFF"

 if tab.is_active then
   background = "#ae8b2d"
   foreground = "#FFFFFF"
 end

 local title = wezterm.truncate_right((tab.tab_index + 1) .. ": " .. tab.active_pane.title, max_width - 1) .. "   "

 return {
   { Background = { Color = background } },
   { Foreground = { Color = foreground } },
   { Text = title }
 }
end)


-- Finally, return the configuration to wezterm:
return config
