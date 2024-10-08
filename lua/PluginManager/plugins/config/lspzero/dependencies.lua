return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"j-hui/fidget.nvim",
		opts = {
			progress = {
				display = {
					done_icon = "",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local _border = "rounded"

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = _border,
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = _border,
			})

			vim.diagnostic.config({ float = { border = _border } })
		end,
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/nvim-cmp",
	"onsails/lspkind.nvim",
	{
		"L3MON4D3/LuaSnip",
		build = (function()
			if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
				return
			end
			return "make install_jsregexp"
		end)(),
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
}
