test_restrictions_are_enforced_on_input_range = () ->
  inputs = [0,-1,-2,4000,4001,5000]
  for input in inputs
    test_callback = () ->
        romanNumeralGenerator(input)

    assertException( test_callback,"Error" )

#"Cannot convert (#{input}): Only numbers in the range ( 1 .. 3999 ) are supported"

test_i_is_1 = () ->
    assertEquals("I",romanNumeralGenerator(1))

test_ii_equals_2 = () ->
    assertEquals("II",romanNumeralGenerator(2))

test_iii_equals_3 = () ->
    assertEquals("III",romanNumeralGenerator(3))

test_iv_equals_4 = () ->
   assertEquals("IV",romanNumeralGenerator(4))

test_v_equals_5 = () ->
   assertEquals("V",romanNumeralGenerator(5))

test_ix_equals_9 = () ->
   assertEquals("IX",romanNumeralGenerator(9))

test_x_equals_10 = () ->
   assertEquals("X",romanNumeralGenerator(10))

test_ix_equals_40 = () ->
   assertEquals("XL",romanNumeralGenerator(40))

test_x_equals_50 = () ->
   assertEquals("L",romanNumeralGenerator(50))

test_ix_equals_90 = () ->
   assertEquals("XC",romanNumeralGenerator(90))

test_c_equals_100 = () ->
   assertEquals("C",romanNumeralGenerator(100))

test_ix_equals_400 = () ->
   assertEquals("CD",romanNumeralGenerator(400))

test_c_equals_500 = () ->
   assertEquals("D",romanNumeralGenerator(500))

test_LM_equals_900 = () ->
   assertEquals("CM",romanNumeralGenerator(900))

test_c_equals_1000 = () ->
   assertEquals("M",romanNumeralGenerator(1000))

test_vi_equals_6 = () ->
   assertEquals("VI",romanNumeralGenerator(6))

test_vii_equals_7 = () ->
   assertEquals("VII",romanNumeralGenerator(7))

test_viii_equals_8 = () ->
   assertEquals("VIII",romanNumeralGenerator(8))

test_xi_equals_11 = () ->
   assertEquals("XI",romanNumeralGenerator(11))

test_MMMCMXCIX_equals_3999 = () ->
   assertEquals("MMMCMXCIX",romanNumeralGenerator(3999))

test_MMMCMXCVIII_equals_3998 = () ->
   assertEquals("MMMCMXCVIII",romanNumeralGenerator(3998))

test_MMMCMXCVII_equals_3997 = () ->
   assertEquals("MMMCMXCVII",romanNumeralGenerator(3997))

test_MMMCMXCVI_equals_3996 = () ->
   assertEquals("MMMCMXCVI",romanNumeralGenerator(3996))

test_MMMCMXCV_equals_3995 = () ->
   assertEquals("MMMCMXCV",romanNumeralGenerator(3995))

test_MMMCMXCIV_equals_3994 = () ->
   assertEquals("MMMCMXCIV",romanNumeralGenerator(3994))

tests = {
    "test_restrictions_are_enforced_on_input_range": test_restrictions_are_enforced_on_input_range,
    "test_i_is_1": test_i_is_1,
    "test_ii_equals_2": test_ii_equals_2,
    "test_iii_equals_3": test_iii_equals_3,
    "test_iv_equals_4" : test_iv_equals_4,
    "test_v_equals_5" : test_v_equals_5,
    "test_ix_equals_9" : test_ix_equals_9,
    "test_x_equals_10" : test_x_equals_10,
    "test_ix_equals_40" : test_ix_equals_40,
    "test_x_equals_50" : test_x_equals_50,
    "test_ix_equals_90" : test_ix_equals_90,
    "test_c_equals_100" : test_c_equals_100,
    "test_ix_equals_400" : test_ix_equals_400,
    "test_c_equals_500" : test_c_equals_500,
    "test_LM_equals_900" : test_LM_equals_900,
    "test_c_equals_1000" : test_c_equals_1000,
    "test_vi_equals_6" : test_vi_equals_6,
    "test_vii_equals_7" : test_vii_equals_7,
    "test_viii_equals_8" : test_viii_equals_8,
    "test_xi_equals_11" : test_xi_equals_11,
    "test_MMMCMXCIX_equals_3999" : test_MMMCMXCIX_equals_3999,
    "test_MMMCMXCVIII_equals_3998" : test_MMMCMXCVIII_equals_3998,
    "test_MMMCMXCVII_equals_3997" : test_MMMCMXCVII_equals_3997,
    "test_MMMCMXCVI_equals_3996" : test_MMMCMXCVI_equals_3996,
    "test_MMMCMXCV_equals_3995" : test_MMMCMXCV_equals_3995,
    "test_MMMCMXCIV_equals_3994" : test_MMMCMXCIV_equals_3994
}

TestCase("tests for roman numerals kata", tests)
