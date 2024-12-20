return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    -- Lazy load the plugin when <F5> is pressed
    keys = {
        { "<F5>", function() require("dap").continue() end },
        { "<F10>", function() require("dap").step_over() end },
        { "<F11>", function() require("dap").step_into() end },
        { "<F12>", function() require("dap").step_out() end },
        { "<Leader>db", function() require("dap").toggle_breakpoint() end },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Set up DAP and DAP UI
        dapui.setup()

        -- DAP adapter configuration for PWA Node
        dap.adapters.pwa_node = {
            type = "executable",
            command = "node",
            args = {
                "/home/snehil/.local/share/nvim/mason/packages/js-debug-adapter/out/src/nodeDebug.js",  -- PWA Node Adapter path
            },
        }

        -- DAP configurations for JavaScript (with sourcemaps)
        dap.configurations.javascript = {
            {
                type = "pwa_node",  -- Use pwa-node instead of node2
                request = "launch",
                name = "Launch File",
                program = "${file}",
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = "inspector",
                console = "integratedTerminal",
            },
            {
                type = "pwa_node",  -- Use pwa-node instead of node2
                request = "attach",
                name = "Attach to Process",
                processId = require("dap.utils").pick_process,
                cwd = vim.fn.getcwd(),
            },
        }

        -- DAP UI listeners
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.after.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.after.event_exited.dapui_config = function() dapui.close() end
    end,
}

