return {
	-- "ellisonleao/gruvbox.nvim",
	-- name = "gruvbox",
	-- priority = 1000,
	-- lazy = false,
	--
	-- config = function()
	-- 	require("gruvbox").setup({
	-- 		bold = true,
	-- 		contrast = "hard",
	-- 		transparent_mode = true,
	-- 	})
	-- 	vim.cmd.colorscheme("gruvbox")
	-- end,
	--
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		})
		vim.cmd.colorscheme("rose-pine")
	end,
}

