local apply = function(config)
  config.colors = require 'color_schemes.lua.selenized_white'
  config.color_scheme_dirs = {
    './color_schemes/toml'
  }

  local ansi_map = {
    { name = "black",   hex = "#282c34" },
    { name = "red",     hex = "#e06c75" },
    { name = "green",   hex = "#98c379" },
    { name = "yellow",  hex = "#e5c07b" },
    { name = "blue",    hex = "#61afef" },
    { name = "magenta", hex = "#c678dd" },
    { name = "cyan",    hex = "#56b6c2" },
    { name = "white",   hex = "#dcdfe4" },
    --{ name = "default", hex = "" },
  }

  local extractHex = function(ansi_map)
    local new_tbl = {}
    for _, elem in ipairs(ansi_map) do
      table.insert(new_tbl, elem.hex)
    end
    return new_tbl
  end

  config.colors.ansi = extractHex(ansi_map)

  config.bold_brightens_ansi_colors = false
end
return apply
