return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- Install/update a parser with `:TSInstall <lang>` / `:TSUpdate`.
        require("nvim-treesitter").install({
            "bash", "c", "csv", "diff", "dockerfile", "gitignore", "go",
            "ini", "javascript", "jsdoc", "json", "lua", "make", "markdown",
            "markdown_inline", "python", "rust", "terraform", "toml",
            "typescript", "vim", "vimdoc", "yaml", "zig", "ocaml", "ocaml_interface"
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                if pcall(vim.treesitter.start, args.buf) then
                    vim.bo[args.buf].indentexpr =
                        "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
