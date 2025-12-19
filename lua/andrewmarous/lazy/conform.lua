return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "gofmt" },
                c = { 'clang-format' },
                cpp = { 'clang-format' },
                rust = { 'rustfmt' },
                python = { 'isort', 'black' },
                typescript = { 'prettierd' },
                terraform = { 'terraform_fmt' },
            },
            formatters = {
                ["clang-format"] = {
                    prepend_args = { "--style=file" }
                }
            }
        })
    end
}

