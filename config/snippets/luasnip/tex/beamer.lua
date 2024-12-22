-- Beamer-specific completions

local luasnip = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta

local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node

return {
	snippet(
		{ trig = "frame", name = "frame", dscr = "frame environment" },
		fmta(
			[[
                \begin{frame}{<>}
                    <>
                \end{frame}
            ]],
			{ insert_node(1, "Title"), insert_node(0) }
		)
	),
	snippet(
		{ trig = "cols", name = "columns", dscr = "columns environment" },
		fmta(
			[[
                \begin{columns}
                    <>
                \end{columns}
            ]],
			{ insert_node(0) }
		)
	),
	snippet({ trig = "ps", "pause", "Presentation pause" }, text_node([[\pause]])),
}
