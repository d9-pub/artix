return {
    {
        "hrsh7th/nvim-cmp",
        ft = { "c" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                preselect = cmp.PreselectMode.Item,
                completion = { completeopt = "menu,menuone,noinsert" },
                window = { documentation = cmp.config.window.bordered() },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"]      = cmp.mapping.confirm({ select = false }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Tab>"]     = cmp.mapping(function(fallback)
                        if cmp.visible() then cmp.select_next_item() else fallback() end
                    end, { "i", "s" }),
                    ["<S-Tab>"]   = cmp.mapping(function()
                        if cmp.visible() then cmp.select_prev_item() end
                    end, { "i", "s" }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer", keyword_length = 3 },
                },
            })
        end,
    },
}
