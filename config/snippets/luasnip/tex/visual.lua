local luasnip = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta

local snippet = luasnip.snippet
local dynamic_node = luasnip.dynamic_node
local snippet_node = luasnip.snippet_node
local insert_node = luasnip.insert_node

local function get_visual(_, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return snippet_node(nil, insert_node(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return snippet_node(nil, insert_node(1))
	end
end

-- Vimtex context detection
local in_env = function(name) -- generic environment detection
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end
local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local in_itemize = function()
	return in_env("itemize")
end

return {
	-- Generic
	snippet(
		{ trig = "tit", name = "Italic", dscr = "Italic text" },
		fmta([[\textit{<>}]], { dynamic_node(1, get_visual) })
	),
	snippet(
		{ trig = "tbf", name = "Bold", dscr = "Bold text" },
		fmta([[\textbf{<>}]], { dynamic_node(1, get_visual) })
	),
	snippet(
		{ trig = "ttt", name = "Monospaxed", dscr = "Monospaced text" },
		fmta([[\texttt{<>}]], { dynamic_node(1, get_visual) })
	),

	-- Itemize
	snippet(
		{ trig = "it", "item", dscr = "List item" },
		insert_node([[\item <>]], { insert_node(0) }),
		{ condition = in_itemize }
	),

	-- Math
	snippet(
		{ trig = "ff", name = "frac", dscr = "fraction" },
		fmta([[\frac{<>}{<>}]], { dynamic_node(1, get_visual), insert_node(2, "divider") }),
		{ condition = in_mathzone }
	),
	snippet(
		{ trig = "ee", name = "exp", dscr = "explicit exponent" },
		fmta([[\euler^{<>}]], { dynamic_node(1, get_visual) }),
		{ condition = in_mathzone }
	),
}
