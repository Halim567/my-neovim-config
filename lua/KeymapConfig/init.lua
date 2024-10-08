vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>sd", vim.cmd.Ex)
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<leader>ih", function()
	if vim.lsp.inlay_hint.is_enabled() then
		vim.lsp.inlay_hint.enable(false)
	else
		vim.lsp.inlay_hint.enable(true)
	end
end)
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<leader>p", '"_dP')
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>o", 'o<Esc>0"_D')
vim.keymap.set("n", "<leader>O", 'O<Esc>0"_D')
vim.keymap.set("v", "<C-t>", ">>")

vim.keymap.set("n", "<leader>t", function()
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		local buf_name = vim.api.nvim_buf_get_name(buf)
		local path = string.match(buf_name, "term://.*//%d+:(.+)")

		if path == "/usr/bin/zsh" then
			vim.api.nvim_buf_delete(buf, { force = true })
			return
		end
	end

	vim.cmd(":split | resize 8 | terminal")
end)

vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, silent = true })

vim.keymap.set("n", "<A-Up>", "<C-w>k")
vim.keymap.set("n", "<A-Down>", "<C-w>j")
vim.keymap.set("n", "<A-Right>", "<C-w>l")
vim.keymap.set("n", "<A-Left>", "<C-w>h")

vim.keymap.set("n", "<A-Up>", "<Cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<A-Down>", "<Cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<A-Right>", "<Cmd>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<A-Left>", "<Cmd>TmuxNavigateLeft<cr>")

vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<leader>sq", ":wq<CR>")
vim.keymap.set("n", "<leader>fq", ":q!<CR>")
vim.keymap.set("n", "<leader>qq", ":q<CR>")
vim.keymap.set("n", "<Leader>vb", "<C-v>", { noremap = true, silent = true })
vim.keymap.set("v", "<Leader>vb", "<C-v>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })
