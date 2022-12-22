local ok1, lsp = pcall(require, "lsp-zero")
local ok2, navic = pcall(require, "nvim-navic")
if not (ok1 and ok2) then
	return 
end

lsp.preset("recommended")
lsp.on_attach(function(client, bufnr)
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
end)

lsp.configure('sumneko_lua', {
	settings = {
		Lua = {
			diagnostics = {
				globals = {'vim'},
			},
		},
	},
})

lsp.configure('jsonls', {
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
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json"
					},
					url = "https://json.schemastore.org/prettierrc.json"
				},
				{
					fileMatch = {".eslintrc", ".eslintrc.json"},
					url = "https://json.schemastore.org/eslintrc.json"
				},
				{
					fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
					url = "https://json.schemastore.org/babelrc.json"
				},
				{
					fileMatch = {"lerna.json"},
					url = "https://json.schemastore.org/lerna.json"
				},
				{
					fileMatch = {"now.json", "vercel.json"},
					url = "https://json.schemastore.org/now.json"
				},
				{
					fileMatch = {
						".stylelintrc",
						".stylelintrc.json",
						"stylelint.config.json"
					},
					url = "http://json.schemastore.org/stylelintrc.json"
				}
			}
		}
	}
})

lsp.nvim_workspace()
lsp.setup()
