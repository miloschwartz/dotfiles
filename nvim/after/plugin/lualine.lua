require('lualine').setup {
    options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_a = {
            { 'mode', fmt = function(str) return string.lower(str) end }
        },
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}
