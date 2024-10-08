return function()
	local lspZero = require("lsp-zero")
	local lspAttach = function(_, bufnr)
		local opts = { buffer = bufnr }
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "qd", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
	end

	lspZero.extend_lspconfig({
		sign_text = true,
		lsp_attach = lspAttach,
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	})

	require 'lspconfig'.gleam.setup {
		settings = {
			gleam = {
				format = {
					tabSize = 4,
					shiftWidth = 4,
					indentSize = 4, -- Ukuran indentasi 4 spasi
					convertTabsToSpaces = true -- Mengubah karakter tab menjadi spasi
				}
			}
		}
	}

	require("mason").setup({
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✅",
				package_pending = "🔃",
				package_uninstalled = "❎",
			},
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = { "ts_ls" },
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
		},
	})

	local cmp = require("cmp")
	local _ = lspZero.cmp_action()
	require("luasnip.loaders.from_vscode").lazy_load()
	local luasnip = require("luasnip")
	luasnip.config.setup({})

	local lspkind = require("lspkind")
	lspkind.setup()

	cmp.setup({
		formatting = {
			format = lspkind.cmp_format({ mode = "text_symbol" }),
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		completion = { completeopt = "menu,menuone,noinsert" },
		mapping = cmp.mapping.preset.insert({
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<C-l>"] = cmp.mapping(function()
				if luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				end
			end, { "i", "s" }),
			["<C-h>"] = cmp.mapping(function()
				if luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { "i", "s" }),
		}),
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "buffer" },
			{
				name = "lazydev",
				group_index = 0,
			},
		},
	})
end
