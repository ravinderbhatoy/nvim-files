require("core.options") -- Load general options
require("core.keymaps") -- Load general keymaps
require("core.snippets") -- Custom code snippets
vim.opt.clipboard:append("unnamedplus")

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	-- require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.none-ls"),
	require("plugins.gitsigns"),
	require("plugins.alpha"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
	require("plugins.toggleterm"),
})

-- Keymap to compile and run C++ files
local Terminal = require("toggleterm.terminal").Terminal

-- Define the run_cpp function
_G.run_cpp = function()
	local filename = vim.fn.expand("%:t")
	if filename == "" then
		print("No file found! Open a C++ file first.")
		return
	end
	local filepath = vim.fn.expand("%:p:h")
	vim.cmd("lcd " .. filepath) -- Set working directory to file's location

	local output = filename:gsub("%.cpp$", "")
	-- Update command to handle errors and keep terminal open
	local cmd = "g++ "
		.. filename
		.. " -o "
		.. output
		.. " && ./"
		.. output
		.. " || echo 'Compilation or runtime error!'; echo ''; and echo 'Press any key to exit...'; read"
	print("Running command: " .. cmd) -- Debugging output

	local term = require("toggleterm.terminal").Terminal:new({ cmd = cmd, direction = "float", shell = vim.o.shell })
	term:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua _G.run_cpp()<CR>", { noremap = true, silent = true })

-- Map the function to a keybinding
