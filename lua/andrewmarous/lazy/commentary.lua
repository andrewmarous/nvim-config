return {
    'tpope/vim-commentary',
    vim.keymap.set('v', '<leader>c', "<Plug>Commentary"),
    vim.keymap.set('v', '<leader>C', "<Plug>CommentaryLine")
}
