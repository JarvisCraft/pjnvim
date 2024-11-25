local luasnip = require("luasnip")
local extras = require("luasnip.extras")
local fmta = require("luasnip.extras.fmt").fmta

local snippet = luasnip.snippet
local insert_node = luasnip.insert_node
local rep = extras.rep

return {
    snippet(
        { trig = "beg", name = "begin/end", dscr = "begin/end environment" },
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            { insert_node(1, "environment"), insert_node(0), rep(1) }
        )
    ),
    snippet(
        { trig = "eq", name = "equation", dscr = "Equation environment" },
        fmta(
            [[
                \begin{equation}\label{<>}
                    <>
                \end{equation}
            ]],
            { insert_node(1, "label"), insert_node(0) }
        )
    ),
}
