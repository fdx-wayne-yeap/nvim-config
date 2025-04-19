return {
    { "junegunn/fzf",    dir = "~/.fzf", build = "./install --all" },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end,
        keys = {
            { "<leader>ff", "<cmd>FzfLua git_files<cr>", desc = "File picker (Git)" },
            { "<leader>fF", "<cmd>FzfLua files<cr>", desc = "File picker" },
            { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Old files" },
            { "<leader>fj", "<cmd>FzfLua jumps<cr>", desc = "Jumps (Nav History)" },
            { "<leader>f/", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
            { "<leader>fr/", "<cmd>FzfLua live_grep_resume<cr>", desc = "Live grep resume" },
        }
    }
}
