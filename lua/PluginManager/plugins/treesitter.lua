return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = { "lua", "vim", "vimdoc", "luadoc", "javascript", "typescript" },
			sync_install = false,
			auto_install = true,
			modules = {},
			ignore_install = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true }
		})
	end

}
