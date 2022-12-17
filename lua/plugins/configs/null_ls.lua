local status_ok, null_ls = pcall(require, 'null-ls')

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.stylelint,
		formatting.prettier.with({
			-- filetypes = { "js", "ts", "jsx", "tsx", "json" },
			extra_args = {
				"--single-quote",
				"--jsx-single-quote"
			},
		}),
		diagnostics.eslint.with({
			diagnostic_config = {
				-- see :help vim.diagnostic.config()
				underline = true,
				virtual_text = false,
				signs = false,
				update_in_insert = false,
				severity_sort = true,
			},
		})
	},
})
