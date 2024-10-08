return function()
	local ui = require("harpoon.ui")
	local mark = require("harpoon.mark")

	vim.keymap.set("n", "<leader>a", function()
		if mark.get_length() >= 4 then
			print("Hanya 4 file yang dapat ditandai")
		else
			mark.add_file()
			print("File ditambahkan")
		end
	end)
	vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

	vim.keymap.set("n", "<A-1>", function()
		ui.nav_file(1)
	end)
	vim.keymap.set("n", "<A-2>", function()
		ui.nav_file(2)
	end)
	vim.keymap.set("n", "<A-3>", function()
		ui.nav_file(3)
	end)
	vim.keymap.set("n", "<A-4>", function()
		ui.nav_file(4)
	end)

	vim.keymap.set("n", "<A-n>", ui.nav_next)
	vim.keymap.set("n", "<A-p>", ui.nav_prev)
end
