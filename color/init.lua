local apply = function(wezterm, config)
  --config.color_scheme = 'Wild Cherry (Gogh)'
  --config.color_scheme = 'Builtin Solarized Dark'
  --config.color_scheme = 'Builtin Solarized Light'

  -- wezterm.gui is not available to the mux server, so take care to
  -- do something reasonable when this config is evaluated by the mux
  function get_appearance()
    if wezterm.gui then
      local mode = wezterm.gui.get_appearance()
      print("Color mode: " .. mode)
      return mode
    end
    return 'Dark'
  end
  
  function scheme_for_appearance(appearance)
    if appearance:find 'Dark' then
      return 'Builtin Solarized Dark'
    else
      return 'Builtin Solarized Light'
    end
  end

  config.color_scheme = scheme_for_appearance(get_appearance())

  config.color_scheme_dirs = {
    './color/color_schemes/toml',
    './color/color_schemes/iTerm2-Color-Schemes/wezterm'
  }

  -- -- Colors override color schemes
  -- config.colors = require 'color.color_schemes.lua.selenized_white'
  -- local ansi_map = {
  --   { name = "black",   hex = "#282c34" },
  --   { name = "red",     hex = "#e06c75" },
  --   { name = "green",   hex = "#98c379" },
  --   { name = "yellow",  hex = "#e5c07b" },
  --   { name = "blue",    hex = "#61afef" },
  --   { name = "magenta", hex = "#c678dd" },
  --   { name = "cyan",    hex = "#56b6c2" },
  --   { name = "white",   hex = "#dcdfe4" },
  --   --{ name = "default", hex = "" },
  -- }

  -- local extractHex = function(ansi_map)
  --   local new_tbl = {}
  --   for _, elem in ipairs(ansi_map) do
  --     table.insert(new_tbl, elem.hex)
  --   end
  --   return new_tbl
  -- end

  --config.colors.ansi = extractHex(ansi_map)


  config.bold_brightens_ansi_colors = false
end
return apply
