local ls = require("luasnip")
local sn = ls.snippet_node
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")


ls.add_snippets("all", {
	s('co', {
		i('console.log($1)')
	}),
	s("cortime", {
		f(function ()
			return os.date "%D -%H:%M"
		end)
	}),
})

ls.add_snippets("lua", {
	s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
	s("test", fmt("one{} = two{} tree{}", { i(1,""), i(2,""), i(3,"")})),
	s(
		'ml',
		fmt(
			[[
				local {} = function({})
					{}
				end
			]],
			{
				i(1,""),
				i(2,""),
				i(3,""),
			}
		)
	)
})
ls.add_snippets("javascript",  {
	s("cl",
		{
			t("console.log("),i(1),t(")")
		}
	),
	s("ea",
	{
		t("() => "), i(1)
	}),
	s("af",
	{
		t("("), i(1), t(") => "), i(2)
	}),
	s("im",
	{
		t("import "), i(2), t(" from '"), i(1), t("'")
	})
})
