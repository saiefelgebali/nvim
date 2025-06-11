return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        local catppuccin = require("catppuccin")

        catppuccin.setup({
            flavour = "macchiato",
            integrations = {
                telescope = {
                    style = "nvchad",
                    enabled = true,
                },
            },
            transparent_background = true,
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
