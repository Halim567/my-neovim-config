local Statusline = require('EditorConfig.statusline')

vim.api.nvim_exec2([[
	augroup Statusline
		au!
		au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
		au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
		au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
	augroup END
]], {
	output = false
})

-- paragraf
vim.opt.nu = true
vim.opt.relativenumber = true
vim.g.have_nerd_font = true

-- tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = true
vim.opt.smartindent = false
vim.opt.cindent = false

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gleam",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = true
	end
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Save undo history
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

-- Show which line your cursor is on
vim.opt.cursorline = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.showmode = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"

vim.cmd("set laststatus=3")
