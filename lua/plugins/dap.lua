return {
    {
        "mfussenegger/nvim-dap",
        optional = true,
        config = function()
            local dap = require("dap")
            if not dap.adapters["pwa-chrome"] then
                dap.adapters["pwa-chrome"] = {
                    type = "server",
                    host = "localhost",
                    port = "${port}",
                    executable = {
                        command = "node",
                        args = {
                            require("mason-registry")
                            .get_package("js-debug-adapter")
                            :get_install_path()
                            .. "/js-debug/src/dapDebugServer.js",
                            "${port}",
                        },
                    },
                }
            end
            for _, lang in ipairs({
                "typescript",
                "javascript",
                "typescriptreact",
                "javascriptreact",
            }) do
                dap.configurations[lang] = dap.configurations[lang] or {}
                table.insert(dap.configurations[lang], {
                    type = "pwa-chrome",
                    request = "launch",
                    name = "Launch Chrome",
                    url = "http://localhost:8084",
                    sourceMaps = true,
                })
            end
        end,
    },
    { "nvim-neotest/nvim-nio" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        keys = {
            { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
            { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
        },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },
    "mfussenegger/nvim-lint",
    { "jay-babu/mason-nvim-dap.nvim", opts = {} },
}
