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
            { "<leader><space>f", "<cmd>FzfLua git_files formatter=path.filename_first<cr>", desc = "File picker (Git)" },
            { "<leader><space>F", "<cmd>FzfLua files formatter=path.filename_first<cr>", desc = "File picker" },
            { "<leader><space>o", "<cmd>FzfLua oldfiles formatter=path.filename_first<cr>", desc = "Old files" },
            { "<leader><space>j", "<cmd>FzfLua jumps<cr>", desc = "Jumps (Nav History)" },

            { "<leader><space>ca", "<cmd>FzfLua lsp_code_actions previewer=false<cr>", desc = "Code Actions" },
            { "<leader><space>cA", "<cmd>FzfLua lsp_code_actions<cr>", desc = "Code Actions (Preview)" },
            { "<leader><space>cr", "<cmd>FzfLua lsp_references<cr>", desc = "Code References" },
            { "<leader><space>cd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Code Definitions" },
            { "<leader><space>ci", "<cmd>FzfLua lsp_implementations<cr>", desc = "Code Implementations" },
            { "<leader><space>cs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Code Document Symbols" },
            { "<leader><space>cS", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Code Workspace Symbols" },

            { "<leader><space>lq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix" },
            { "<leader><space>ll", "<cmd>FzfLua loclist<cr>", desc = "Location list" },

            { "<leader><space>ts", "<cmd>FzfLua treesitter<cr>", desc = "Treesitter" },

            { "<leader><space>//", "<cmd>FzfLua live_grep formatter=path.filename_first<cr>", desc = "Live grep" },
            { "<leader><space>/r", "<cmd>FzfLua live_grep_resume formatter=path.filename_first<cr>", desc = "Live grep resume" },
            { "<leader><space>/g", "<cmd>FzfLua live_grep_glob formatter=path.filename_first<cr>", desc = "Live grep glob" },

            { "<leader><space>dd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Diagnostics (Document)" },
            { "<leader><space>dw", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Diagnostics (Workspace)" },
        }
    }
}
