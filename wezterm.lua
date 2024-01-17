-- Pull in the wezterm API
local wezterm = require 'wezterm'
local selenized_white =  require'color_schemes.lua.selenized_white'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

require'font'(config)

config.colors = selenized_white
--config.color_scheme = 'AdventureTime'
config.color_scheme_dirs = {
  './color_schemes/toml'
}
config.hide_tab_bar_if_only_one_tab = true
return config
