return {
    {
        "folke/trouble.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons', },
        config = function()
            require("trouble").setup({
                mode = 'diagnostics',
            })

            local map = vim.keymap.set
            map('n', '<leader>tt', '<cmd>Trouble diagnostics<cr>', { silent = true })

        end
    },
}
