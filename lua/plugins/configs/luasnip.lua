local status_ok, ls = pcall(require, 'luasnip')

if not status_ok then
	return
end

local types = require('luasnip.util.types')
ls.setup({
	history = true,
	update_events = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/snippets/" } })

vim.keymap.set({"i", "s"}, "<M-k>", function ()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true})

vim.keymap.set({"i", "s"}, "<M-j>", function ()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true})

vim.keymap.set({"i", "s"}, "<M-l>", function ()
	if ls.choice_active() then
		ls.change_choice()
	end
end, { silent = true})

