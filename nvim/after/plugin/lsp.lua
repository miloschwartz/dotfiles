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

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'tsserver', 'eslint' },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

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

-- local lspkind = require('lspkind')
-- cmp.setup {
--   formatting = {
--     format = lspkind.cmp_format({
--       mode = 'symbol_text', -- show only symbol annotations
--       maxwidth = 65, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
--                      -- can also be a function to dynamically calculate max width such as 
--                      -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
--       ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
--       show_labelDetails = true, -- show labelDetails in menu. Disabled by default
--
--       -- The function below will be called before any actual modifications from lspkind
--       -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
--       before = function (entry, vim_item)
-- 		  vim_item.menu = ""
--         return vim_item
--       end
--     })
--   }
-- }

local lspconfig = require('lspconfig')
lspconfig.yamlls.setup {
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
}

local cmp_nvim_lsp = require "cmp_nvim_lsp"
lspconfig.clangd.setup {
	on_attach = on_attach,
	capabilities = cmp_nvim_lsp.default_capabilities(),
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
}

-- local util = lspconfig.util
lspconfig.pyright.setup {
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
}

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
