local selenized_white =  require'color_schemes.lua.selenized_white'

local apply = function(config)
  config.colors = selenized_white
  config.color_scheme_dirs = {
    './color_schemes/toml'
  }
end
return apply
