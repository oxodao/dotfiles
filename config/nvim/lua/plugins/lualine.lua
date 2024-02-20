-- Set lualine as statusline
-- See `:help lualine.txt`

-- @TODO: Make its own nvim package
local colors = {
    lightorange = "#413932",
    darkorange  = "#C57A30",

    bg = "#241B2F",
    bg_dark = "#171520",
    bg_darker = "#14131D",
    yellow = "#FEDE5D",
    green = "#72f1b8",
    gray = "#888888",
    gray_light = '',
    purple = "#463465",
    purple_light = "#5E4E79",
    white = '#ffffff',
    salmon = '#f97e72'
}

local synthwave = {}

synthwave.normal = {
    a = { fg = colors.bg_dark,    bg = colors.yellow },
    b = { fg = colors.gray,       bg = colors.bg_dark }, -- only for GIT
    c = { fg = colors.gray,       bg = colors.bg },
    x = { fg = colors.gray,       bg = colors.bg_dark },
    y = { fg = colors.yellow,     bg = colors.bg_dark },
    z = { fg = colors.bg_dark,    bg = colors.yellow },
}
synthwave.insert = {
    a = { fg = colors.bg_dark,  bg = colors.green },
    y = { fg = colors.green,    bg = colors.bg_dark },
    z = { fg = colors.bg_dark,  bg = colors.green },
}
synthwave.visual = {
    a = { fg = colors.white,    bg = colors.purple_light },
    y = { fg = colors.white,   bg = colors.bg_dark },
    z = { fg = colors.white,    bg = colors.purple_light },
}
synthwave.replace = {
    a = { fg = colors.bg,         bg = colors.salmon },
    y = { fg = colors.salmon,       bg = colors.bg_dark },
    z = { fg = colors.bg,         bg = colors.salmon },
}
synthwave.command = {
    a = { bg = colors.darkorange, fg = colors.bg },
    y = { fg = colors.gray,       bg = colors.lightorange },
    z = { fg = colors.bg,         bg = colors.darkorange },
}
synthwave.inactive = {
    a = { fg = colors.lightgray,  bg = colors.bg_darker },
    b = { fg = colors.lightgray,  bg = colors.bg_darker },
    c = { fg = colors.lightgray,  bg = colors.bg_darker },
    x = { fg = colors.lightgray,  bg = colors.bg_darker },
    y = { fg = colors.lightgray,  bg = colors.bg_darker },
    z = { fg = colors.lightgray,  bg = colors.bg_darker },
}

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = synthwave,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
}
