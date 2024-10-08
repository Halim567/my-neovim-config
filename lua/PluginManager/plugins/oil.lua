return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "<leader>sd", "<CMD>Oil<CR>")
	end,
}
