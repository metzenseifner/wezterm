local effects = {}
-- Regex syntax is from Rust (based on Perl syntax)
-- https://docs.rs/regex/latest/regex/#syntax

local merge = function(a, b)
  local c = {}
  for k, v in pairs(a) do c[k] = v end
  for k, v in pairs(b) do c[k] = v end
  return c
end

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
effects.make_github_username_project_clickable = function(tbl)
  table.insert(tbl, {
    regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
    format = 'https://www.github.com/$1/$3',
    highlight = 1,
  })
end

effects.make_jira_issue_keys_clickable = function(tbl)
  table.insert(tbl, {
    -- see https://docs.rs/regex/latest/regex/#syntax
    regex = [[([A-Z]+)([-]{1})([\d]+)]],
    format = 'https://dt-rnd.atlassian.net/browse/$1-$3',
    highlight = 0,
  })
end

--effects.make_url_wrapped_in_parenthesis_clickable = function(tbl)
--  table.insert(tbl, {
--    regex = [[\((\w+:\S+)\)]],
--    format = '$1',
--    highlight = 1,
--  })
--end

effects.make_urls_clickable = function(tbl)
  table.insert(tbl, {
    regex = [[(\w+:[\]a-zA-Z0-9-._~:/?#@!$&'*+,;%=]+)]],
    format = '$1',
    highlight = 1,
  })
end

local apply = function(wezterm, config)
  local result = {}
  for _, effect in pairs(effects) do
    effect(result) -- populate the table result
  end
  config.hyperlink_rules = result -- merge(wezterm.default_hyperlink_rules(), result)
  -- [Hi I am a markdown link](https://www.google.at)
end

return apply
