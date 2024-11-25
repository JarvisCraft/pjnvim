local luasnip = require("luasnip")
local fmt = require("luasnip.extras.fmt")

local snippet = luasnip.snippet
local insert_node = luasnip.insert_node

return {
	snippet(
		{ trig = "url", name = "URL", dscr = "literal URL link" },
		fmt.fmta([[\url{<>}]], { insert_node(1, "url") })
	),
	snippet(
		{ trig = "hr", name = "link", dscr = "named URL link" },
		fmt.fmta([[\href{<>}{<>}]], { insert_node(1, "url"), insert_node(2, "display name") })
	),
}
