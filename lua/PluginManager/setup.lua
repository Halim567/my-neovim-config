require("lazy").setup({
	require("PluginManager.plugins.theme"),

	require("PluginManager.plugins.harpoon"),
	require("PluginManager.plugins.undotree"),
	require("PluginManager.plugins.oil"),
	require('PluginManager.plugins.tmuxnavigation'),

	require("PluginManager.plugins.autoclose").autoclose,
	require("PluginManager.plugins.autoclose").autotags,
	require("PluginManager.plugins.autoclose").surround,
	require("PluginManager.plugins.telescope"),
	require("PluginManager.plugins.formatter"),
	require("PluginManager.plugins.gccomment"),
	require("PluginManager.plugins.multiselect"),

	require("PluginManager.plugins.treesitter"),
	require("PluginManager.plugins.lspzero"),
})
