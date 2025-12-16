return {
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local servers = {
            lua_ls = {
                capabilities = capabilities,
            },
            cssls = {
                capabilities = capabilities,
            },
            denols = {
                capabilities = capabilities,
            },
            svelte = {
                capabilities = capabilities,
            },
            emmet_ls = {
                capabilities = capabilities,
            },
        }

        for name, config in pairs(servers) do
            vim.lsp.config(name, config)
        end
    end,
}
