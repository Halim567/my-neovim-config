return {
	"kdheepak/monochrome.nvim",
	config = function()
		require("monochrome")
		vim.cmd("colorscheme monochrome")
	end,
}
