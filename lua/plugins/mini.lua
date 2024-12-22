return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function(_, opts)
            require("mini.notify").setup(opts)
            require("mini.files").setup(opts)
        end,
        keys = {
            {
                "<leader>fm",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
                end,
                desc = "Open mini.files (Directory of Current File)",
            },
            {
                "<leader>fM",
                function()
                    require("mini.files").open(vim.uv.cwd(), true)
                end,
                desc = "Open mini.files (cwd)",
            },
        },
    }
}
