return {
    { "junegunn/fzf",    dir = "~/.fzf", build = "./install --all" },
    { "junegunn/fzf.vim" },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    }
}
