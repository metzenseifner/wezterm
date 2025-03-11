local apply = function(wezterm, config)
  config.debug_key_events = true
  config.key_map_preference = "Mapped"
  config.keys = {

    { key = "z", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
    -- Map Option key to act as Meta
    -- { key = "x", mods = "OPT",  action = wezterm.action { SendString = "\x1bx" } },
    -- { key = "x", mods = "OPT",  action = wezterm.action { SendKey = { key = "x", mods = "ALT" } } },
    { key = "x", mods = "OPT",  action = wezterm.action { SendString = "\x1ba" } },

  }
end
return apply
