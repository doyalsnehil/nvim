return {
	"mfussenegger/nvim-dap",
	dependencies = {

		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "/home/snehil/.local/share/nvim/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Debug",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.after.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.after.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set("n", "<F5>", dap.continue, { silent = true })
		vim.keymap.set("n", "<F10>", dap.step_over, { silent = true })
		vim.keymap.set("n", "<F11>", dap.step_into, { silent = true })
		vim.keymap.set("n", "<F12>", dap.step_out, { silent = true })
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { silent = true })
	end,
}
