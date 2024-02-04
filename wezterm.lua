-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

require 'font' (config)
require 'color' (config)
require 'hyperlinks' (wezterm, config)

config.hide_tab_bar_if_only_one_tab = true config.default_prog = { '/opt/homebrew/bin/tmux' }

-- macOS specific expansion (like AltGr on other OS)
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
--WezTerm is now able to perform dead-key expansion when use_ime = false
config.use_ime = true
--set use_dead_keys = false to skip the hold state; continuing the example above, Right-Opt n will then immediately produce ~.
config.use_dead_keys = true



config.term = "xterm-256color"
--keys = {
--  -- make ctrl-\ work (or not)
--  { key = "phys:7", mods = "CTRL|ALT|SHIFT", action = "DisableDefaultAssignment" }
--}

return config
