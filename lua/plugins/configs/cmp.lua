-- CMP
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- Luasnip expand
		end,
	},

	-- Клавиши, которые будут взаимодействовать в nvim-cmp
	mapping = cmp.mapping.preset.insert({
		['<C-[>'] = cmp.mapping.scroll_docs(-4),
		['<C-]>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item()
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' }, -- LSP
		{ name = 'nvim_lsp_signature_help' }, -- Помощь при ведении параметров в методах
		{ name = 'luasnip' }, -- Luasnip
		{ name = 'buffer' }, -- Буфферы
	}),
}
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
