return {
	{
		"mfussenegger/nvim-dap",
		optional = true,
		keys = {
			{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
			{ "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
			{ "<leader>dc", function() require("dap").continue() end,                                             desc = "Run/Continue" },
			{ "<leader>da", function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
			{ "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
			{ "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
			{ "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
			{ "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
			{ "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
			{ "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
			{ "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
			{ "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
			{ "<leader>dP", function() require("dap").pause() end,                                                desc = "Pause" },
			{ "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
			{ "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
			{ "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
			{ "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
		},
		config = function()
			-- load mason-nvim-dap here, after all adapters have been setup
			-- require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))

			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

			-- setup dap config by VsCode launch.json file
			local vscode = require("dap.ext.vscode")
			local json = require("plenary.json")
			vscode.json_decode = function(str)
				return vim.json.decode(json.json_strip_comments(str))
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
	-- mason.nvim integration
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = true,
		},
		ensure_installed = { 'node2' },
	},
}
