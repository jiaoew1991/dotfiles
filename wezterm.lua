local wezterm = require 'wezterm'

return {
    leader = { key = ';', mods = 'CTRL' },
    color_scheme = "nightfox",
    keys = {
        {
            key = 'd',
            mods = 'CMD',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        {
            key = 'd',
            mods = 'CMD|SHIFT',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
        },
        {
            key = 'h',
            mods = 'LEADER',
            action = wezterm.action.ActivatePaneDirection 'Left',
        },
        {
            key = 'l',
            mods = 'LEADER',
            action = wezterm.action.ActivatePaneDirection 'Right',
        },
        {
            key = 'j',
            mods = 'LEADER',
            action = wezterm.action.ActivatePaneDirection 'Down',
        },
        {
            key = 'k',
            mods = 'LEADER',
            action = wezterm.action.ActivatePaneDirection 'Up',
        },
    },
    scrollback_lines = 50000,
    use_fancy_tab_bar = true,
    font_size = 12,
}
