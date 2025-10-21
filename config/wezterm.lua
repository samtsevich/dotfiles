-- ~/.wezterm.lua
local wezterm = require("wezterm")

-- -- Store custom tab titles and colors
-- local tab_info = {}

-- -- Event: Rename tab interactively
-- wezterm.on('rename-tab', function(window, pane)
--   window:perform_action(
--     wezterm.action.PromptInputLine {
--       description = 'Enter new tab name',
--       action = function(input)
--         if input then
--           local tab_id = window:active_tab().tab_id
--           tab_info[tab_id] = tab_info[tab_id] or {}
--           tab_info[tab_id].title = input
--           window:active_tab():set_title(input)
--         end
--       end,
--     },
--     pane
--   )
-- end)

-- -- Event: Set tab color interactively
-- wezterm.on('set-tab-color', function(window, pane)
--   window:perform_action(
--     wezterm.action.PromptInputLine {
--       description = 'Enter tab color (hex, e.g. #ff8800)',
--       action = function(input)
--         if input and input:match('^#%x%x%x%x%x%x$') then
--           local tab_id = window:active_tab().tab_id
--           tab_info[tab_id] = tab_info[tab_id] or {}
--           tab_info[tab_id].color = input
--           window:active_tab():set_title(tab_info[tab_id].title or window:active_tab().active_pane.title)
--         end
--       end,
--     },
--     pane
--   )
-- end)

-- -- Event: Format tab title and color
-- wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
--   local info = tab_info[tab.tab_id] or {}
--   local title = info.title or tab.active_pane.title
--   local color = info.color or '#222222'
--   return {
--     { Background = { Color = color } },
--     { Text = ' ' .. title .. ' ' },
--   }
-- end)

return {
  -- Appearance
  -- colors = {
  --   foreground = "#CBE0F0",
  --   background = "#011423",
  --   cursor_bg = "#47FF9C",
  --   cursor_border = "#47FF9C",
  --   cursor_fg = "#011423",
  --   selection_bg = "#033259",
  --   selection_fg = "#CBE0F0",
  --   ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
  --   brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
  -- },
  font = wezterm.font("JetBrainsMono Nerd Font Mono"),
  font_size = 18,
  default_cursor_style = "SteadyBar",
  color_scheme = "Catppuccin Mocha",
  window_background_opacity = 0.8,
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  -- window_decorations = "RESIZE",

  colors = {
    tab_bar = {
      background = '#181825',  -- Matches Catppuccin Mocha base

      active_tab = {
        bg_color = '#89b4fa',  -- Catppuccin Mocha blue
        fg_color = '#1e1e2e',  -- Dark text for contrast
        intensity = 'Bold',
      },

      inactive_tab = {
        bg_color = '#313244',  -- Catppuccin Mocha surface0
        fg_color = '#a6adc8',  -- Catppuccin Mocha subtext0
      },
      
      inactive_tab_hover = {
        bg_color = '#45475a',  -- Catppuccin Mocha surface1
        fg_color = '#cdd6f4',  -- Catppuccin Mocha text
      },
    },
  },

  keys = {
    -- Option+Arrow for word navigation
    {
      key = "RightArrow",
      mods = "OPT",
      action = wezterm.action{SendString="\x1bf"},
    },
    {
      key = "LeftArrow",
      mods = "OPT",
      action = wezterm.action{SendString="\x1bb"},
    },
    -- -- Rename tab: Cmd+Shift+R
    -- {
    --   key = 'r',
    --   mods = 'CMD|SHIFT',
    --   action = wezterm.action.PromptInputLine {
    --     description = 'Enter new tab name',
    --     action = function(window, pane, line)
    --       if line then
    --         window:active_tab():set_title(line)
    --       end
    --     end,
    --   },
    -- },
    -- -- Set tab color: Cmd+Shift+C
    -- {
    --   key = 'c',
    --   mods = 'CMD|SHIFT',
    --   action = wezterm.action.PromptInputLine {
    --     description = 'Enter tab color (hex, e.g. #ff8800)',
    --     action = function(window, pane, line)
    --       if line and line:match('^#%x%x%x%x%x%x$') then
    --         window:active_tab():set_background_color(line)
    --       end
    --     end,
    --   },
    -- },
    -- {
    --   key = 'r',
    --   mods = 'CMD|SHIFT',
    --   action = wezterm.action.EmitEvent 'rename-tab',
    -- },
    -- {
    --   key = 'c',
    --   mods = 'CMD|SHIFT',
    --   action = wezterm.action.EmitEvent 'set-tab-color',
    -- },
  },
}
