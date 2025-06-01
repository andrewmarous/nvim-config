return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "gofmt" },
                c = { 'astyle' },
                rust = { 'rustfmt' },
                python = { 'isort', 'black' },
                typescript = { 'prettierd' },
                terraform = { 'terraform_fmt' },
            }
        })
    end
}

