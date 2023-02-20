local status_ok, null_ls = pcall(require, 'null-ls')

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.prettier.with({
			filetypes = { "js", "ts", "jsx", "tsx", "json" },
			extra_args = {
				"--single-quote",
				"--jsx-single-quote"
			},
		}),
		formatting.stylelint.with({
			filetypes = { "scss", "less", "css", "sass" },
		}),
		diagnostics.eslint.with({
			diagnostic_config = {
				underline = true,
				virtual_text = false,
				signs = false,
				update_in_insert = false,
				severity_sort = true,
			},
		}),
		diagnostics.stylelint.with({
			diagnostic_config = {
				underline = true,
				virtual_text = false,
				signs = false,
				update_in_insert = false,
				severity_sort = true,
			},
		}),
	},
})
