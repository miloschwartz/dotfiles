local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

	-- lsp_zero.default_keymaps({buffer = bufnr})
	-- lsp_zero.buffer_autoformat()
end)

local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

-- Simple root_pattern helper using vim.fs.root (Neovim 0.11+)
local function root_pattern(...)
	local patterns = { ... }
	return function(bufnr, on_dir)
		for _, pattern in ipairs(patterns) do
			local root = vim.fs.root(bufnr, pattern)
			if root then
				on_dir(root)
				return
			end
		end
	end
end

require('mason').setup({})
require('mason-lspconfig').setup({
	-- ensure_installed = {
	-- 	"angularls",
	-- 	"bashls",
	-- 	"black",
	-- 	"cmake",
	-- 	"docker_compose_language_server",
	-- 	"dockerls",
	-- 	"eslint",
	-- 	"goimports",
	-- 	"golines",
	-- 	"gopls",
	-- 	"graphql",
	-- 	"prettier",
	-- 	"pyright",
	-- 	"ts_ls",
	-- 	"yamlls"
	-- },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			vim.lsp.config('lua_ls', lua_opts)
		end,
		gopls = function()
			vim.lsp.config('gopls', {
				on_attach = on_attach,
				capabilities = lsp_zero.default_capabilities(),
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
					}
				}
			})
		end,
	}
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local capabilities = cmp_nvim_lsp.default_capabilities()
local lsp_flags = {}

cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip', keyword_length = 2 },
		{ name = 'buffer',  keyword_length = 3 },
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-h>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
		-- close completion menu
		['<C-p>'] = cmp.mapping.close(),
	}),
})

vim.lsp.config('yamlls', {
	settings = {
		yaml = {
			format = {
				enable = true,
			},
			hover = true,
			completion = true,

			customTags = {
				"!fn",
				"!And",
				"!If",
				"!Not",
				"!Equals",
				"!Or",
				"!FindInMap sequence",
				"!Base64",
				"!Cidr",
				"!Ref",
				"!Ref Scalar",
				"!Sub",
				"!GetAtt",
				"!GetAZs",
				"!ImportValue",
				"!Select",
				"!Split",
				"!Join sequence"
			},
		},
	},
})

vim.lsp.config('clangd', {
	on_attach = on_attach,
	capabilities = cmp_nvim_lsp.default_capabilities(),
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})

vim.lsp.config('pyright', {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = 'openFilesOnly',
				typeCheckingMode = 'off',
			},
		},
	},
	-- root_dir = function(fname)
	--     return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
	--     util.path.dirname(fname)
	-- end
})

-- lsp_zero.set_sign_icons({
-- 	error = ' ',
-- 	warn = ' ',
-- 	hint = '󱠂 ',
-- 	info = ' '
-- })

lsp_zero.set_sign_icons({
	error = '',
	warn = '',
	hint = '',
	info = ''
})

vim.lsp.config('eslint', {
	on_attach = on_attach,
	capabilities = capabilities,
})
