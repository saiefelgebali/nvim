return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        -- "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            notify = {
                enabled = false,
            },
            cmdline = {
                enabled = true, -- enables the Noice cmdline UI
                view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
                opts = {}, -- global options for the cmdline. See section on views
                ---@type table<string, CmdlineFormat>
                format = {
                    -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                    -- view: (default is cmdline view)
                    -- opts: any options passed to the view
                    -- icon_hl_group: optional hl_group for the icon
                    -- title: set to anything or empty string to hide
                    cmdline = { pattern = "^:", icon = "_", lang = "vim", title = "" },
                    search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "?" },
                    input = {}, -- Used by input()
                    -- lua = false, -- to disable a format, set to `false`
                },
            },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
            views = {
                mini = {
                    win_options = {
                        winblend = 0,
                    },
                },
                cmdline_popup = {
                    position = {
                        row = 5,
                        col = "50%",
                    },
                    border = {
                        padding = { 0, 1 },
                    },
                    filter_options = {},
                    win_options = {
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 8,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "none",
                        padding = { 1, 3 },
                    },
                    win_options = {
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    },
                },
            },
        })

        vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#8ba4b0", bg = "NONE" })
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#658594", bg = "NONE" })
        vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { fg = "#8ba4b0", bg = "NONE" })
    end,
}
