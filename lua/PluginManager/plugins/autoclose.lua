return {
	autoclose = {
		"m4xshen/autoclose.nvim",
		opts = {},
	},
	autotags = {
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	surround = { -- Surround
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}
