return {
    { 
        "sindrets/diffview.nvim",
        command = "DiffviewOpen",
        keys = {
            {
                "<leader>gh",
                "<cmd>DiffviewFileHistory %<cr>",
                desc = "Diff File History"
            },
            {
                "<leader>gd",
                "<cmd>DiffviewOpen<cr>",
                desc = "Diff Index"
            },
        }, 
    }
}
