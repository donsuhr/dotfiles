local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.initial_cols = 83
config.initial_rows = 28

config.font_size = 13
config.font = wezterm.font {
  family = 'RobotoMono Nerd Font',
  weight = 'Light'
}
config.line_height = .9

config.color_scheme = 'nord'

config.set_environment_variables = {
  ITERM_PROFILE = 'dark'
}

config.term = 'wezterm'

config.hide_tab_bar_if_only_one_tab = true

config.keys = {
  {
    key = 'Enter',
    mods = 'CMD',
    action = wezterm.action.ToggleFullScreen,
  },
}

config.window_padding = {
  left = '0cell',
  right = '0cell',
  top = '0cell',
  bottom = '0cell',
}

config.native_macos_fullscreen_mode = false

return config
