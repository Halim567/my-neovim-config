return function()
	local telescope = require("telescope")

	telescope.setup({
		extensions = {
			file_browser = {
				hijack_netrw = true,
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown {
					-- even more opts
				}
			}
		},
	})

	telescope.load_extension("ui-select")

	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<space>fB", function()	telescope.extensions.file_browser.file_browser() end)
	vim.keymap.set("n", "<leader>ff", builtin.find_files)
	vim.keymap.set("n", "<leader>fg", builtin.live_grep)
	vim.keymap.set("n", "<leader>fb", builtin.buffers)
	vim.keymap.set("n", "<leader>fh", builtin.help_tags)
	vim.keymap.set("n", "<leader><leader>", builtin.buffers)
	vim.keymap.set("n", "<leader>f.", builtin.oldfiles)
	vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
	vim.keymap.set("n", "<leader>fn", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end)
end
