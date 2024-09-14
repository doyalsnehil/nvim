return {
-- add plugins here if you want to add plugins just paste the name of github username followed by the plugins itself
-- install dependecies if you want with it 
	{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      --"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
	--add plugins ......
}
}
