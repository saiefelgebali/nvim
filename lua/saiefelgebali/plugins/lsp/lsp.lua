return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            -- "ts_ls", This was slow for larger projects, using typescript-tools now
            "html",
            "cssls",
            "tailwindcss",
            "svelte",
            "lua_ls",
            "graphql",
            "emmet_ls",
            "prismals",
            "pyright",
            "terraformls",
            "rust_analyzer",
            "denols",
        },
    },
    dependencies = {
        "neovim/nvim-lspconfig",
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            },
        },
    },
    config = function()
        local servers = {
            kotlin_ls = {
                cmd = { "kotlin-lsp", "--stdio" },
                single_file_support = true,
                filetypes = { "kotlin" },
                root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },
            cssls = {
                settings = {
                    css = {
                        validate = true,
                        lint = {
                            unknownAtRules = "ignore",
                        },
                    },
                },
            },
            denols = {
                enabled = false,
            },
            svelte = {
                on_attach = function(client, _)
                    vim.api.nvim_create_autocmd("BufWritePost", {
                        pattern = { "*.js", "*.ts" },
                        callback = function(ctx)
                            -- Here use ctx.match instead of ctx.file
                            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                        end,
                    })
                end,
            },
            emmet_ls = {
                filetypes = {
                    "html",
                    "typescriptreact",
                    "javascriptreact",
                    "css",
                    "sass",
                    "scss",
                    "less",
                    "svelte",
                },
            },
            rust_analyzer = {},
            terraformls = {},
            html = {},
            dartls = {
                cmd = { 'fvm', 'dart', 'language-server', '--protocol=lsp' },
                filetypes = { 'dart' },
                root_markers = { 'pubspec.yaml' },
                init_options = {
                    onlyAnalyzeProjectsWithOpenFiles = true,
                    suggestFromUnimportedLibraries = true,
                    closingLabels = true,
                    outline = true,
                    flutterOutline = true,
                },
                settings = {
                    dart = {
                        completeFunctionCalls = true,
                        showTodos = true,
                    },
                },
            },
        }

        for name, config in pairs(servers) do
            vim.lsp.config(name, config)
            vim.lsp.enable(name)
        end
    end,
}
