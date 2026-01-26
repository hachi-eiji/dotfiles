-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

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

config.keys = {
  -- Split
  { key = "d", mods = "CMD", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "D", mods = "CMD", action = act.SplitVertical { domain = "CurrentPaneDomain" } },

  -- Pane focus
  { key = "LeftArrow",  mods = "CMD|ALT", action = act.ActivatePaneDirection "Left" },
  { key = "RightArrow", mods = "CMD|ALT", action = act.ActivatePaneDirection "Right" },
  { key = "UpArrow",    mods = "CMD|ALT", action = act.ActivatePaneDirection "Up" },
  { key = "DownArrow",  mods = "CMD|ALT", action = act.ActivatePaneDirection "Down" },

  -- Resize pane
  { key = "LeftArrow",  mods = "CMD|ALT|SHIFT", action = act.AdjustPaneSize { "Left", 5 } },
  { key = "RightArrow", mods = "CMD|ALT|SHIFT", action = act.AdjustPaneSize { "Right", 5 } },
  { key = "UpArrow",    mods = "CMD|ALT|SHIFT", action = act.AdjustPaneSize { "Up", 5 } },
  { key = "DownArrow",  mods = "CMD|ALT|SHIFT", action = act.AdjustPaneSize { "Down", 5 } },

  -- Close
  { key = "w", mods = "CMD", action = act.CloseCurrentPane { confirm = true } },
  { key = "w", mods = "CMD|SHIFT", action = act.CloseCurrentTab { confirm = true } },

  -- Tabs
  { key = "t", mods = "CMD", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "]", mods = "CMD|SHIFT", action = act.ActivateTabRelative(1) },
  { key = "[", mods = "CMD|SHIFT", action = act.ActivateTabRelative(-1) },
  { key = "}", mods = "CMD", action = act.MoveTabRelative(1) },
  { key = "{", mods = "CMD", action = act.MoveTabRelative(-1) },

  -- Zoom
  { key = "Enter", mods = "CMD|SHIFT", action = act.TogglePaneZoomState },
}

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
