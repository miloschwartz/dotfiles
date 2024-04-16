require('lualine').setup {
    options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = '',
        component_separators = '',
    },
    extensions = { "nvim-tree", "oil" },
    sections = {
        lualine_a = {
            { 'mode', fmt = function(str) return string.lower(str) end }
        },
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'diagnostics', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
}
