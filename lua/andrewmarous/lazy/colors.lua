function ColorMyPencils(color)
    color = color or 'solarized'
    vim.cmd.colorscheme(color)
end

-- Make the function globally accessible
_G.ColorMyPencils = ColorMyPencils

return {
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        end,
    },
    {
        "maxmx03/solarized.nvim",
        name = "solarized",
        config = function ()
            require("solarized").setup({
                transparent = {
                    enabled = false,
                    pmenu = true,
                    normal = true,
                    normalfloat = true,
                    neotree = true,
                    nvimtree = true,
                    whichkey = true,
                    telescope = true,
                    lazy = true,
                },
                on_highlights = nil,
                on_colors = nil,
                palette = 'solarized', -- solarized (default) | selenized
                variant = 'summer', -- "spring" | "summer" | "autumn" | "winter" (default)
                error_lens = {
                    text = false,
                    symbol = false,
                },
                styles = {
                    enabled = true,
                    types = {},
                    functions = {},
                    parameters = {},
                    comments = {},
                    strings = {},
                    keywords = {},
                    variables = {},
                    constants = {},
                },
                plugins = {
                    treesitter = true,
                    lspconfig = true,
                    navic = true,
                    cmp = true,
                    indentblankline = true,
                    neotree = true,
                    nvimtree = true,
                    whichkey = true,
                    dashboard = true,
                    gitsigns = true,
                    telescope = true,
                    noice = true,
                    hop = true,
                    ministatusline = true,
                    minitabline = true,
                    ministarter = true,
                    minicursorword = true,
                    notify = true,
                    rainbowdelimiters = true,
                    bufferline = true,
                    lazy = true,
                    rendermarkdown = true,
                    ale = true,
                    coc = true,
                    leap = true,
                    alpha = true,
                    yanky = true,
                    gitgutter = true,
                    mason = true,
                    flash = true,
                },
            })
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

        end
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
        end
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function ()
            name = 'kanagawa'
            -- Default options:
            require('kanagawa').setup({
                compile = false,             -- enable compiling the colorscheme
                undercurl = true,            -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true},
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,         -- do not set background color
                dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
                terminalColors = true,       -- define vim.g.terminal_color_{0,17}
                colors = {                   -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                theme = "wave",              -- Load "wave" theme
                background = {               -- map the value of 'background' option to a theme
                    dark = "wave",           -- try "dragon" !
                    light = "lotus"
                },
            })

            ColorMyPencils()
        end
    }
}
