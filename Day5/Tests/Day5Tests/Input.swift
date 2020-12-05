let input = """
BBFBBBFLRR
BBFBFBFLLL
FFBBBFBLLL
BFBFBFBRLR
BFFFFFFLRR
FBBFFBFRRL
BFBBBBBLLL
FBBBBFBRRL
FFFBBBFLRR
BBFFFFBRLL
FFBFBFFLLR
BFBBBBBRRL
BBFFBFBLLL
FBBFBBFRRR
FFBFFBFRRR
BBBFBFBLRL
BFBBBBFLLR
BFBFFFFLRL
BBBBFFFLLL
BFBFBFFLRR
FFBBFBFRRR
FBBBFBBLRR
BBFBBFBRRR
BBBFBBFLRR
BFFBBBFRLL
BFBBBFFLRR
FFBBFFFRRL
FBBBFBFLLL
BFBFFFBRLR
BBFFFBFRRL
FBBBBFBLLL
FBFBFFBRRL
FBBFBFBLLR
BBBFBFFLLL
FFBBBFFLRR
FFFBBFBLRL
BFBFFFBRLL
BBBFBBBLRL
FBFFFBBLLR
BFBBFBFLLL
FBFFFFFLRL
BFFBBFFRRR
FBBFFBFRRR
FFBFFBBLRR
BFBFBBBRRL
BFFBBBFLRL
FBBFBBBLRL
FBBBBBBRLR
FBBBBBBLRR
BFBBFBFRLL
BFBBFFBRRL
FBFBBFFRRR
FBBBFFFLLR
BFBBFFFRRL
FFBBFBBRRL
FBFFFFFLLR
BFFBBBBLRL
BFBFFFFLLR
FBFBFFFRRR
FBFBBBFLLL
BBBFFFBLLL
FFFBBFBRLR
FBFBFFFLLL
FBFFBBBRRL
BFFBFBFRRR
FFFBBBBRLR
BFFBFBFLLR
BFFFBFBLLR
BFBBFBBLRL
BFFBBFFLLR
FFFBBBFRLL
BFBFBBFRRR
FBFFFFFLLL
BFFBBFBRRL
BBBFFFFRLL
FBBFFFBRLR
BFFBBBFRLR
BBFBFBFLLR
BFBBFBBLLR
BFFFFFBRRL
BFFFBBFLRR
BBFBBBFLRL
BFBFBBBLLR
BBFFBFFRRR
FFBFFBFRLL
FBBBFFFRLR
FBFFBFFRLR
FBBBFFFRLL
FBFBBFFRRL
BFFBFFBLRL
FBBFFBBLRR
FFFBBBBLRL
BBBFFBFLRR
FBBBFFBRRL
FFBFFFFLRR
BBBFFBFRLL
BBBFBBBRLL
BFFBFFFRLR
BFFBFBBRLL
FFBFFFBRRL
BBFBFFFLLL
BBBFFBBLLR
BFFBBBFRRR
BFBFFFFRLL
FBFFBBFRLL
FFBBBFBRLR
FBBFFBBLLR
BFBBBBBLLR
BFFBFBBLRL
FBBBFFFLRR
FBBBFBFLRL
FBFFFFFRLL
FBFBBBFLLR
BFFFBBFLLR
BBFBFBBLLR
BBFFBFFRRL
BBFFFBBRLL
BFBFBFFRLL
FBBFBBFLRR
FBBBFFFLLL
FBFBBFFLLR
BBFBFBBRLL
BFFFBFFLLR
FBBFFBBRRR
BBFBFBFLRL
BFFFFBFLRR
FBFFFBFRRR
FBFFBBBRLL
FBFBBBBLRL
BFFBFFBLRR
BFBBFBBRLR
BFFFFFBLLL
BFBBBBBRLR
FFBBBFBLRL
BFBFBBFLLR
BBFBBFFLLL
BBBFBBFRLL
FFBFBFBLRL
BBFBBFFRRL
BFBBFFBLRL
FFBFBBFLRL
FBFFFFBLLR
BBBFFBFRRR
BFBFFFBRRR
BBFFBFBLRL
FBFBBBBRRR
FBFBFFBRLL
BFFBFFFLRR
BBBFFFBRRR
BFBBFBFRRL
BFFFBBBLRL
BBFBBFBRRL
BFFBFBBRLR
BFFBBFFLRR
FFBFFFBLLR
FBBBFBFLLR
FBFBBFBRRR
FBBBBFFRRL
FBFFBBFLRL
FBBFFFBLRR
BFBBFFBRLR
BBFBBBFRLR
BFFBBFFRRL
FBBFFFFLRR
BFBFFFFLLL
BBBBFFBRLR
BFBFBFBRRL
FBBBBBFRLR
BFFBFBBRRL
FFBBBFBLRR
FFBBFBFRRL
BFBFBBFRLL
BBFFBFBLRR
BBFBBBBLLR
BFFBBBFLLL
BBFFBBBLRL
FBFBFBBRLL
BBFBBBFRRR
FFBBBFFLLR
BFFBFFFLRL
FBBBFFBRLR
BFFBFFFRLL
FBFBBBBLRR
FBFFBFFLLL
BFBBFBBRRR
BFBFBBBLRL
FBBBFBBLLR
BBFFFFBRRL
BBFBFFFLRL
BBBFFBFLLL
FBFFFFBRLR
BFFFBBBRRR
FFBBFBBRRR
FBFFBFFRRL
BBFBBBBLRR
BBFFBBBRRL
FFBFBFBRLR
BBFBBBBRRL
BBFFFBBLRL
BBBFBBFLLR
FBFFFBBLRR
FBBBBBFLRL
FBBBFBBRRL
FBBBBFFRRR
BFFBBFBLRL
FFBFBBFRLL
FBBFFFBLLR
BBFBBFFRLR
FBBFFBFLRL
BFBFBFBLRR
BBFBBFBLRL
FFBFFBBRRL
FBBFBFFLRR
BFBBBBBRLL
BFFBFBFRRL
FFBFBFFLRL
FBFBFFBLLL
FFBFBBFRRL
FFBBFFBRLR
BBBFBFBLLR
BFBFFFBLRR
FBBFBBBRLL
BBFFBBBRLL
FFFBBFFLRR
BBBFFFBRLR
BBBFBBBLRR
FBFBFFBLRR
BFBBBBBLRL
FBFFFFBRLL
FBBBFFFRRR
FBFFFBBRRR
BBBFFFFLRL
BBFFBFFLRR
FFBFBBBLRR
BFFBFFBRLR
BFBFFBFLLR
FFFBBFFRLR
FFBFFFBLRR
BFBBBFFRLL
BFFFFBFRLR
FFBFBFBLRR
FBBBBFFLLL
FFBBBFFLRL
BBBFBFBRLL
BBFFFBBRRL
BFFFFFBLRL
FBBBFBFRRL
BBBFBBFRRL
BFFFFFBLLR
BFBBFFFLLL
FBFBFBFRLL
BFFFFBBLRR
BBBFFFFRLR
BFFFBBFRRR
BBBFFFFLRR
FBBFBFFRLR
FBFBBFBRLL
BFFBFFBRRR
BFBBBBFRLL
BFBBBFBRLR
FBBBFBFRLR
FBBBBBFRLL
FBFFBBBRLR
BBFFFBBLLR
BBFFBBBLLL
BBBFFFFRRL
BFFBBBBLLL
FFBFFBBRLR
BFBBBFFLLL
FFFBBBBRRR
BBFFBFFLLR
BBFBBFFRRR
FBFBBBFLRL
FBBFBFBRLL
FFBBFBFRLR
BFFFBBFLRL
FBFFFBFRRL
BFBBBFFRRR
FBBFBFBLLL
BFBBBBFRRR
BBBFFBFRRL
FBFBBFBLRL
BFBBBFFLRL
FFFBBBBLLL
FBFBFBFLLR
BBFFBFBRLL
FFBFBFBLLL
FBBFBFBRRR
BFFFBFFRLL
BFFBBFBLLR
BFBBFFFRLR
BFBFFBBRLL
FFBBBFBLLR
BFBFBFFRRL
FBBFFFFLRL
FFBBBFBRLL
FBFBFBBLLL
FBFBFFBLLR
BBBFBBFLRL
FBFFFBBRLR
FBBBFFBRRR
FFFBBBFLLR
BFFFBBBLLR
BBFBBFBLRR
BFBBBBFRRL
BBFBBBFRRL
FFBBFBBRLL
BBFBBFFRLL
FBBBBFBRLL
BFBBFFBRLL
BBBFBFFRLR
FBFFFFFRRR
BBBFBFBLLL
FFFBBFBRRL
BBBFFBBLRL
BBFFBBBRLR
BFBBFFBRRR
FBBFFBBLLL
BFBBFFBLLL
BFFFFBBLLR
FBFFFBFRLL
BFBBBFBLLL
BFFFFBFLRL
BFFFBBBLRR
BFFBBFFRLR
FBBBBFBLRL
FBBFFFBLLL
BFBBFBFLRL
BFFBFBBLLR
BBFFFBFLRL
FFBFFBBRRR
BBFFFBBRLR
BFBFFFFRRR
FFFBBBBRLL
FFBFBBBLRL
BFBFBFFLLL
BBFBBBBRLR
BBFFFBFRLL
FBFFBFFLLR
BBFFBBFRLR
FFBBFBBLRL
BBFBBBBRLL
BBBFBFFLRL
FBBFFBBRLR
BFBFFBBRLR
FBBBBFFLRL
BBFBBFFLLR
FBBFBBFLLR
FFBFFBFLLR
BFBBFBBRLL
FFBFBFBRRR
FBFBFFFLRL
BBBBFFBLRL
BFBFFFBLRL
BBFFFFFRRL
FBFFBBFRRR
BBBFFBFLLR
BFFBFBFLLL
BBFBFBBRRL
BFBBFBBLRR
FBFFFBBRLL
FFBBBBBLLL
BFBBBFFRRL
BBFFFBBRRR
FFBFBBBRRR
FFBBFFFLRR
FBFBFBFLLL
BBBFBFFLRR
BFBFFBFRLR
FBBFFBFRLR
BBFBFBFRRR
BBBFFBBLRR
BFBBFBBRRL
FBBFBFFLRL
BBBBFFFLLR
BBFBFFBLLR
BFFFBFBLRL
BFBFBBBLLL
BFFFFFFRLR
BBFFBFBRRR
BFFBBBBLLR
BBBFBFFRRR
FBFFBBFLLL
FFBFFFBRRR
FBBFFFFRRL
BBFFBBFLLL
FBBBFBBLRL
FFBBFBFLRR
BBFFBBBLRR
FBFFBBBLLL
FBBFFBFLLR
BBFBBBBLLL
BFBFFFBLLR
FBFFFFFRLR
FFBFFBBRLL
FFBBFFBRRL
FBBFBFBLRL
FBBFFFFLLL
FFBFFBFLLL
BFBFBFBLRL
FFBBBBFRRL
BFFBFBFRLR
BBFFBBBRRR
FFBBFFFLLL
FFBBBBBLRL
BFBBBFBLRL
BBFFBBFLRR
FBFBFFFLLR
BFFFFBFRRL
FBFBBFFLRL
FBFFBFBRRR
FFBFFFFLLL
BFBFBFFLLR
BFFFBBBRRL
BFBFFBBLRR
FBBFFFFLLR
FBBBBBFLLL
FBBFFBBRRL
BFFBFBBLRR
FBFFBFBRLL
BFFFBFFLRR
BBFBFFFRLL
BFFFFFFRLL
FFBBBFFRLL
BBFBFBFRLR
BBBFFFBRLL
BFBFBFFLRL
FFFBBFBLRR
BFFBBBFLLR
FFBBBBBRLR
BFFFFBFRRR
FFBFFFFRRR
FFBFFBFLRL
BBFFBBFLLR
FFBFBFBRRL
FFBBFFBRLL
FFBFBFFRLR
BBFBFBBLLL
FBFBFFBRRR
BFBFFBFLRR
FBFFFFBLRR
BFBBBFBRLL
FFBFFFFRLR
BFFFBBFRLL
FFFBBBFRLR
BBBBFFBLRR
BBBFFFBLLR
FFBBBBBLLR
BBFFFFBLLR
BFFFFFFLRL
FFBBFFFRLL
FBFFFBBLLL
FFBFBFFRRL
FBFBBBBRLL
FBFBBFFLRR
FBFBFFFRLR
FBFFBBFLLR
FFBFFFBRLL
BFBFFBFLRL
FFBFBBFLLL
FFBBBFFRLR
BBBFFFFLLR
BFFFBBFRRL
BBFFFBFRLR
BFFBBFFRLL
BBBFFBBRLL
BFBBBBFLRR
FFFBBFBLLR
BBFFBFBRRL
FFBFFFBRLR
FBBBFFFLRL
BBBBFFFLRL
BFFBFFBRRL
FBFFFBFLLL
FFBBBFBRRR
FFBBBFFRRL
BFFBFBBRRR
FBBFBFBLRR
BBFFFFBRRR
FFBFBBBRLR
FFBBFFBLRR
BFFFFFFRRR
BFBBFFFLRL
FBFBFBFLRL
BFBFBBBRLL
FBFFBFBLLL
BBFBFFFRRL
BFBBFFFRRR
BFBBFBFLLR
BFBFBFBRLL
FBFBFBBLLR
FBFBFBFRRR
BBFBFBBLRR
BFBBFBBLLL
BFFFFBFLLL
BFFFBFBLRR
BBFBFBBLRL
FBBBBFBLRR
BBBFBBFRLR
FBBFBFFLLR
FBFFFBFLRL
BBFFFBFLLL
FBBFFFBRRL
BBBFFFFLLL
BFFBFFFLLR
FFBBBFBRRL
BFFBBBBRRL
FFBFBBBRLL
BBFBBFFLRR
FBFBBBBLLL
FFBFBBFRRR
BFFBFFBLLR
BBFFBFFLRL
FFBFBBBLLR
FBBBBBBLLR
BFFFBBBRLR
BBFFBBFLRL
FBFFBBFLRR
FBFFFFBLLL
BFBFBBBRRR
FFBFBBFRLR
FFBFFBBLLL
FFBBBBFRLL
BFBFBFBLLL
BBFBBFFLRL
FFBFBBFLRR
FFBBFBBRLR
FBBBBFBLLR
FBFFBFBLLR
BFFFBBBLLL
FBFFFBFRLR
BBFBBBFLLL
FBBFFBFRLL
FBFBFBFLRR
BFFFBBBRLL
BFBFFBBLLR
BFBBFFFLLR
BFFBBFBLRR
FBBFFBFLRR
FFBBFFFRLR
BBFBBBFLLR
FBFBFFFRRL
FBBBBBBRRL
FBBFFBFLLL
BFFBBBBRRR
BBFBBBFRLL
BFFFFBBLRL
BFBBFBFRRR
FBBFBBBLRR
BFBFBBFLRR
BFBFBBFRLR
FFBFFBFRRL
FBBFBBBRRR
BFFFBFFRRR
BFBFBBBLRR
BFBFBFFRRR
FFBBBBBRRL
FFBFFFFRLL
FFBFFBBLRL
BBBFFFBRRL
FBFBBBBRLR
BBFFFFFLRL
FBBBBBBLRL
BFBBBBFRLR
BFFFBFFRRL
FBFBFFBLRL
FFBBFFFLRL
BFFFBFFRLR
FBFFFFFRRL
BBFBFFBLRR
FBBFFBBLRL
BBFBBFBRLL
FFBBFBBLLR
BBBFBBFLLL
BFFBBFBLLL
BBBFFBBRRL
BFFFFFBRLR
FFBBFBFRLL
FBFFBFBLRL
FBBBFFBRLL
FBBBBBFRRL
FFBBBFFLLL
FBFFFBBLRL
BFBFBBFLLL
BFFFFFBLRR
FBBBFFFRRL
FFBFBBFLLR
BFFBBBBRLR
FBFFBFBRRL
BBFBBFBRLR
FBFFFFBRRL
BFBFFFBLLL
BFFBBBBLRR
FBFFBFFRRR
BFFFFBBRLR
BFBBBFBLLR
FBBBFBFRLL
FBBBBBBLLL
BFFBFBFLRR
BBFFFFFLRR
FBBFBBFRLL
FBFFFBBRRL
BFFFFBBRLL
BFFFBBFRLR
BFFBFBBLLL
FFFBBBFRRL
BBFFFBBLLL
BFFFBFBRLL
BFBBFFBLLR
FBBFFBBRLL
FBBFBFFRRR
FBBFFFBRLL
BBFBFFFRLR
FFFBBBBLRR
BFBBBFFRLR
BFFBFFFRRL
FBBFBFBRLR
BFBBBBBLRR
BBBFBFBRRR
FBBFFFFRLR
FBFFBBBLRL
BFFBBFFLRL
FBBFBFBRRL
BBBFBFFRLL
FBFBBFBLRR
BBFFFFBRLR
BFBBBFFLLR
FBFBBBFRRR
FFBFBFBLLR
BBBFFBBRLR
BFFBFFFLLL
FBFBBFBRRL
FFFBBFBRRR
FBBFFFBLRL
BBFBBFBLLR
BBFFBFBRLR
FBBBFBBLLL
BBFBBBBRRR
FFBFBFFLRR
FBBBBFFLLR
FBBBFBBRLR
BBFFBFFRLR
FBFFFBFLRR
FBFBFBFRRL
FBBBBBBRLL
BFFFFFFLLL
BBFBFBFRLL
BBBFBFBRRL
FBBFBBFLLL
BFFFFBBRRL
BBFBFBBRRR
BBBFBBBRLR
BBBFBBFRRR
BFBFFBFRLL
BFFBFBFRLL
BFBBBFBRRL
BFBFFBBLLL
BFFFFFFLLR
FBFFBBFRRL
FBFFBFFLRR
BBBBFFFRRL
FFBFBFFRLL
FFBFBBBRRL
BFBFFFFLRR
FFBBBBBRRR
FBFBBBFRLR
BBFBFFFLLR
BBFBFFFLRR
FBBFBBBRLR
BFBFFBBRRL
FFFBBBBRRL
BBBFBFBRLR
FBBFBBBLLL
BBBFFFFRRR
BBBFBFBLRR
FBFFBFBRLR
BFFBBFBRRR
BBFFFFFLLL
BFBFFFFRLR
FFBBFFBLLL
FFFBBFFRLL
BBBFFBFLRL
BFFBFFBRLL
FBFBBBFLRR
BFBFBFBRRR
FBFFBFFRLL
FFBBFFFLLR
FFBFFFBLRL
FFFBBBFRRR
FFBBBBFLLR
FFFBBBFLLL
BBBFFFBLRR
BFFFFFBRRR
FFBBFBBLRR
BFBFFBBRRR
BBFFFFFRRR
FFFBBFFRRR
FFBBBFFRRR
BBFFFBFLRR
FFFBBFBLLL
BFBBFFBLRR
FBFBFBFRLR
BBBFBBBRRL
FBBFBBBRRL
BBBFBBBRRR
BFFFBFFLRL
BFBBBBBRRR
BBBBFFBRLL
FBFBBFBLLL
FBFBBFFRLR
BBBFFBBRRR
BBFBFFBLRL
FFBBBBFLLL
FFBBFFFRRR
BBFBFFFRRR
FBBBBBBRRR
BBFFFFFRLR
BFFFBFBRRR
BBFFBBFRRR
BFBBBBFLLL
FFBBFFBLLR
BFBFFBBLRL
FBFBFFBRLR
FBFFBBBRRR
FFFBBBFLRL
BFBFBFBLLR
BFBFBFFRLR
BBBFFFBLRL
FBFBBFFRLL
BBFBFFBRLR
FBBFBBFLRL
FBFFFFFLRR
FFBFBFBRLL
BFBFBBBRLR
BFFBBBFRRL
FBFFFBFLLR
BFFBBFBRLR
BBFFFFBLRL
FFBBBBFLRL
BFFBBBFLRR
FBBBFFBLLR
BBFBFFBRRR
BFFBBFBRLL
FFBBBBFRRR
BBFBFFBRRL
FBBBBFFRLL
BBBBFFBLLL
FBFFBBFRLR
BBFFFFFLLR
BFFFFFBRLL
FBFBBFBLLR
FBFBBFBRLR
BBFBFFBLLL
FFBBFBBLLL
BFFFBFFLLL
BBBFBBBLLR
FBFBFBBRRL
BBFFFBFRRR
FBFFBFFLRL
BBBBFFBRRL
FBFFFFBLRL
BBFBFBBRLR
BFBBFFFRLL
FBFBFFFRLL
FBBFFFFRRR
FFBFFFFLLR
FFBBBBFLRR
BBFFBFFLLL
FFBBFBFLLR
FFBBFFBRRR
FFBBBBBLRR
BFFBFFFRRR
FBBBFBFRRR
FBFFBBBLRR
BBBFBFFLLR
FBFFBBBLLR
BFFBBBBRLL
BFFFFBBLLL
BFFFBFBLLL
FBFBFBBLRR
BBBBFFFLRR
FFBFFFBLLL
BBFBBFBLLL
BFFBFFBLLL
FBBFBBBLLR
FBFFBFBLRR
BFBFFBFRRR
FBFBFBBRLR
FBFFFFBRRR
FFBFFFFRRL
BFBBFFFLRR
BBFBFFBRLL
BBBBFFBLLR
BFFFFFFRRL
BBFFBBFRLL
BBFBFBFLRR
FBBFBFFRRL
BFFFBFBRLR
BBFFBBFRRL
FBBBBBFRRR
FFBBFBFLRL
BFBFBBFRRL
FFFBBFFRRL
BFBFFBFLLL
FBFBBFFLLL
BBBFBFFRRL
FBBFBFFRLL
BBFFFBFLLR
BFFFBFBRRL
FFBFBFFLLL
FBFBFBBRRR
BFFFFBFRLL
FBFBBBBRRL
FBBBFBFLRR
FBBBBFBRLR
FFBFFBBLLR
BBBBFFFRLL
FBBFBFFLLL
FBFBFBBLRL
BFFFBBFLLL
FFBBBBBRLL
BFBBBBFLRL
FFBFFBFLRR
FBBBBBFLRR
BBFFBFBLLR
BFBFBBFLRL
BBBFFBFRLR
FBBBBFFLRR
BFBFFBFRRL
FBFBFFFLRR
FBBFBBFRLR
FBBFFFBRRR
FBBFBBFRRL
BFBFFFBRRL
FFBFBBBLLL
FFBBBBFRLR
FBFBBBFRLL
BBFFFBBLRR
BFFBFBFLRL
BBFFFFBLLL
FBFBBBBLLR
BBBBFFFRLR
FFBBFFBLRL
FBBBFFBLRR
BBFFFFBLRR
BBFFBFFRLL
BBFFFFFRLL
BBBFBBBLLL
FBBBFFBLLL
FBBBFFBLRL
FBBBBBFLLR
FBBBFBBRRR
FBBBFBBRLL
BBBBFFFRRR
BBFFBBBLLR
FBBBBFBRRR
FFFBBBBLLR
BFFFFBFLLR
BBBFFBBLLL
FFBFBFFRRR
FFFBBFBRLL
BFBBBFBLRR
FFBFFFFLRL
BFBBFBFRLR
BFBBBFBRRR
BFFBBFFLLL
BBFBFBFRRL
BBFBBBBLRL
FFBFFBFRLR
FBFBBBFRRL
FFBBFBFLLL
BFFFFBBRRR
FBBBBFFRLR
FBBFFFFRLL
BFBBFBFLRR
""".components(separatedBy: "\n")
