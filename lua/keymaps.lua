--if you want to set a custom keymap just enter the vim.keymap.set followed by key combination and the action you want to perform
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", { silent = true }) --focus neotree
vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, { silent = true }) --format file
vim.keymap.set("n", "<leader>r", ":Neotree reveal<CR>", { silent = true }) -- current fiel reavel neotree

--Telescope Commands ususally Starts with f
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>", { silent = true })
vim.keymap.set("n", "<leader>of", ":Telescope oldfiles<CR>", { silent = true }) --find old files
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true }) -- search for a string in entire project
vim.keymap.set("n", "<leader>fw", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true }) -- search for string or word in current buffer
vim.keymap.set("n", "<leader>gc", ":Telescope git_commits<CR>", { silent = true })
vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true })
vim.keymap.set("n", "<leader>gs", ":Telescope git_status<CR>", { silent = true })


--vim.keymap.set("n", "<leader>gs", "::Neotree float git_status git_base=main<CR>", { silent = true })
vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
--vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR>")
-- Open a terminal in a horizontal split

-- Open a terminal in a vertical split
vim.api.nvim_set_keymap("n", "<Leader>t", ":vsplit | terminal<CR>", { noremap = true, silent = true })

-- Close the current terminal window

vim.api.nvim_set_keymap("t", "<Leader>q", [[<C-\><C-n>:q<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set({"n"}, "<Leader>ca", vim.lsp.buf.code_action, {silent = true})


