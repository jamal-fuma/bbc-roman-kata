@romanNumeralGenerator = (decimal) ->
  # restrict range of input to 1 .. 3999
  max_decimal   = 4000-1
  exceeds_range = "Only numbers in the range ( 1 .. #{max_decimal} ) are supported"
  throw new Error("Cannot convert (#{decimal}): #{exceeds_range}") unless (decimal <= max_decimal && decimal > 0)

  # table of translation factors for each glyph in the subset of the roman numerals supported
  factors = [1000,  900,     500,    400,   100,   90,   50,   40,  10,     9,   5,    4,  1]
  glyphs  = ["M",   "CM",    "D",   "CD",   "C", "XC",  "L", "XL", "X",  "IX", "V", "IV","I"]

  # factorise decimal representation into roman numerals
  result = ""
  for numeral, index in factors

    # in a more cpu focused language we could just use integer division
    remainder = decimal % numeral
    order = Math.floor(( decimal - remainder ) / numeral)

    decimal = remainder
    # this is the js eqivilent of glyph * order in ruby or
    # glyph x order in perl
    result += Array(order+1).join(glyphs[index])
  result
