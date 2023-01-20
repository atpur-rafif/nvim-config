local ok1, mason = pcall(require, "mason")
local ok2, mason_config = pcall(require, "mason-lspconfig")
local ok3, lsp_util = pcall(require, ('lspconfig.util'))
local ok4, navic = pcall(require, "nvim-navic")
local ok5, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not (ok1 and ok2 and ok3 and ok4 and ok5) then
	return
end

mason.setup()
mason_config.setup({
	automatic_installation = true
})

local global_configs = {
	on_attach = function(client, bufnr)
		local opts = {buffer = bufnr, remap = false}

		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end

		if client.name == "eslint" then
			vim.cmd.LspStop('eslint')
			return
		end

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	end,
	capabilities = cmp_nvim_lsp.default_capabilities(),
}

local configs = {
	denols = {
		root_dir = lsp_util.root_pattern("deno.json")
	},
	tsserver = {
		root_dir = lsp_util.root_pattern("package.json")
	},
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = {'vim'},
				},
			},
		},
	},
	jsonls = {
		filetypes = {"json", "jsonc"},
		settings = {
			json = {
				schemas = {
					{
						fileMatch = {"package.json"},
						url = "https://json.schemastore.org/package.json"
					},
					{
						fileMatch = {"tsconfig*.json"},
						url = "https://json.schemastore.org/tsconfig.json"
					},
					{
						fileMatch = {"deno.json", "deno.jsonc"},
						url = "https://raw.githubusercontent.com/denoland/deno/main/cli/schemas/config-file.v1.json"
					}
				}
			}
		}
	}
}

local setup_handlers = {
	function(server_name)
		require("lspconfig")[server_name].setup(global_configs)
	end
}

for server_name, config in pairs(configs) do
	for k, v in pairs(global_configs) do
		config[k] = v
	end

	setup_handlers[server_name] = function()
		require("lspconfig")[server_name].setup(config)
	end
end

mason_config.setup_handlers(setup_handlers)
