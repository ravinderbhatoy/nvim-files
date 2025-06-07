return {
	{
		"akinsho/toggleterm.nvim",
		version = "*", -- Use the latest version
		config = function()
			require("toggleterm").setup({
				size = 20, -- Terminal height or width
				open_mapping = [[<c-/>]], -- Key to toggle terminal
				hide_numbers = true, -- Hide line numbers
				shade_terminals = true,
				shading_factor = 2, -- 1 for dark, 3 for light
				start_in_insert = true,
				persist_size = true,
				direction = "float", -- Options: "horizontal", "vertical", "tab", "float"
				close_on_exit = true,
				shell = vim.o.shell, -- Default shell
			})
		end,
	},
}



