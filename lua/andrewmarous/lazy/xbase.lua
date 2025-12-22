return {
    "xbase-lab/xbase",
    build = "make install",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        require("xbase").setup({})
    end
}
