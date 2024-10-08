return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		'nvim-telescope/telescope-ui-select.nvim'
	},
	config = require('PluginManager.plugins.config.telescope')
}
