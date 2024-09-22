return {
    "lewis6991/gitsigns.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('gitsigns').setup {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local function map(mode, lhs, rhs, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, lhs, rhs, opts)
                end

                -- Navigation
                map('n', '<leader>ghs', gs.stage_hunk, { desc = 'Stage Hunk' })
                map('n', '<leader>ghr', gs.reset_hunk, { desc = 'Reset Hunk' })
                map('n', '<leader>ghp', gs.preview_hunk, { desc = 'Preview Hunk' })
                map('n', '<leader>ghb', gs.blame_line, { desc = 'Blame Line' })
                map('n', '<leader>ghd', gs.diffthis, { desc = 'Diff This' })
                map('n', '<leader>gH', gs.toggle_deleted, { desc = 'Toggle Deleted' })
            end
        }
    end,
}

