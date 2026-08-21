return {
    {
        "christoomey/vim-tmux-navigator",
        dependencies = { "paulbkim-dev/vim-herdr-navigation" },
        lazy = false,
        init = function()
            -- Let vim-herdr-navigation own <C-hjkl>. Its editor script falls
            -- back to TmuxNavigate* when inside tmux, so tmux keeps working.
            vim.g.tmux_navigator_no_mappings = 1
        end,
        config = function()
            dofile(vim.fn.stdpath("data") .. "/lazy/vim-herdr-navigation/editor/nvim.lua")
        end,
    },
    "gpanders/editorconfig.nvim",
}
