require 'test/unit'

def encode(decimal)
  # restrict range of input to 1 .. 3999
  max_decimal   = 4000-1
  exceeds_range = "Only numbers in the range ( 1 .. #{max_decimal} ) are supported"
  raise "Cannot convert (#{decimal}): #{exceeds_range}" unless (decimal <= max_decimal && decimal > 0)

  # table of translation factors for each glyph in the subset of the roman numerals supported
  factors = [1000,  900,     500,    400,   100,   90,   50,   40,  10,     9,   5,    4,  1]
  glyphs  = ["M",   "CM",    "D",   "CD",   "C", "XC",  "L", "XL", "X",  "IX", "V", "IV","I"]

  # factorise decimal representation into roman numerals
  result = ""
  factors.each_with_index{|numeral,index|
    order   = decimal / numeral
    decimal = decimal % numeral
    result += glyphs[index] * order
  }
  result
end

class TestRoman < Test::Unit::TestCase
  def test_restrictions_are_enforced_on_input_range
    inputs = [0,-1,-2,4000,4001,5000]
    inputs.each{|input|
      m = assert_raise(RuntimeError){ encode(input) }
      assert_match(m,%r{Cannot convert \(#{input}\): Only numbers in the range \( 1 .. 3999 \) are supported})
    }
  end

  def test_i_equals_1
    assert("I" == encode(1))
  end

  def test_ii_equals_2
    assert("II" == encode(2))
  end

  def test_iii_equals_3
    assert("III" == encode(3))
  end

  def test_iv_equals_4
    assert("IV" == encode(4))
  end

  def test_v_equals_5
    assert("V" == encode(5))
  end

  def test_ix_equals_9
    assert("IX" == encode(9))
  end

  def test_x_equals_10
    assert("X" == encode(10))
  end

  def test_ix_equals_40
    assert("XL" == encode(40))
  end

  def test_x_equals_50
    assert("L" == encode(50))
  end

  def test_ix_equals_90
    assert("XC" == encode(90))
  end

  def test_c_equals_100
    assert("C" == encode(100))
  end

  def test_ix_equals_400
    assert("CD" == encode(400))
  end

  def test_c_equals_500
    assert("D" == encode(500))
  end

  def test_LM_equals_900
    assert("CM" == encode(900))
  end

  def test_c_equals_1000
    assert("M" == encode(1000))
  end

  def test_vi_equals_6
    assert("VI" == encode(6))
  end

  def test_vii_equals_7
    assert("VII" == encode(7))
  end

  def test_viii_equals_8
    assert("VIII" == encode(8))
  end

  def test_xi_equals_11
    assert("XI" == encode(11))
  end

  def test_MMMCMXCIX_equals_3999
    assert("MMMCMXCIX" == encode(3999))
  end

  def test_MMMCMXCVIII_equals_3998
    assert("MMMCMXCVIII" == encode(3998))
  end

  def test_MMMCMXCVII_equals_3997
    assert("MMMCMXCVII" == encode(3997))
  end

  def test_MMMCMXCVI_equals_3996
    assert("MMMCMXCVI" == encode(3996))
  end

  def test_MMMCMXCV_equals_3995
    assert("MMMCMXCV" == encode(3995))
  end

  def test_MMMCMXCIV_equals_3994
    assert("MMMCMXCIV" == encode(3994))
  end
end
