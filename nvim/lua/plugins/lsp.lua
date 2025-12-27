return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.filetype.add({
                extension = {
                    h = "c",
                },
            })

            vim.lsp.config['clangd'] = {
                cmd = { 'clangd' },
                filetypes = { 'c' },
                root_markers = { '.git', 'Makefile' },
            }

            vim.lsp.enable('clangd')
        end
    }
}
