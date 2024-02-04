local wezterm = require 'wezterm'

local apply = function(config)
  config.font = wezterm.font('Hack Nerd Font', { weight = 'Bold', italic = false })
  config.font_size = 15.0
  config.font_rules = {
  }
end

return apply
