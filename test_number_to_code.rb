require File.join(File.dirname(__FILE__), 'number_to_code.rb')
require 'test/unit'

class TestNumberToWords < Test::Unit::TestCase
  def test_number_to_words
    assert_equal "uno", 1.to_words
    assert_equal "dos", 2.to_words
    assert_equal "tres", 3.to_words
    assert_equal "cuatro", 4.to_words
    assert_equal "cinco", 5.to_words
    assert_equal "seis", 6.to_words
    assert_equal "siete", 7.to_words
    assert_equal "ocho", 8.to_words
    assert_equal "nueve", 9.to_words

    assert_equal "diez", 10.to_words
    assert_equal "once", 11.to_words
    assert_equal "doce", 12.to_words
    assert_equal "trece", 13.to_words
    assert_equal "catorce", 14.to_words
    assert_equal "quince", 15.to_words
    assert_equal "dieciseis", 16.to_words
    assert_equal "diecisiete", 17.to_words
    assert_equal "dieciocho", 18.to_words
    assert_equal "diecinueve", 19.to_words
    assert_equal "veinte", 20.to_words
    assert_equal "veintiuno", 21.to_words
    assert_equal "veintidos", 22.to_words
    assert_equal "veintitres", 23.to_words
    assert_equal "veinticuatro", 24.to_words
    assert_equal "veinticinco", 25.to_words
    assert_equal "veintiseis", 26.to_words
    assert_equal "veintisiete", 27.to_words
    assert_equal "veintiocho", 28.to_words
    assert_equal "veintinueve", 29.to_words

    assert_equal "treinta", 30.to_words
    assert_equal "treinta y cuatro", 34.to_words
    assert_equal "cuarenta y siete", 47.to_words
    assert_equal "cincuenta y uno", 51.to_words
    assert_equal "sesenta", 60.to_words
    assert_equal "setenta y nueve", 79.to_words
    assert_equal "ochenta y seis", 86.to_words
    assert_equal "noventa y nueve", 99.to_words

    assert_equal "cien", 100.to_words
    assert_equal "doscientos", 200.to_words
    assert_equal "trescientos", 300.to_words
    assert_equal "cuatrocientos", 400.to_words
    assert_equal "quinientos", 500.to_words

    assert_equal "seiscientos sesenta y tres", 663.to_words
    assert_equal "ochocientos setenta y seis", 876.to_words
    assert_equal "quinientos sesenta y ocho", 568.to_words
    assert_equal "quinientos dos", 502.to_words
    assert_equal "trescientos cuarenta y seis", 346.to_words
    assert_equal "ciento cuarenta y ocho", 148.to_words

    assert_equal "mil uno", 1001.to_words
    assert_equal "mil doscientos noventa y uno", 1291.to_words
    assert_equal "mil novecientos noventa y nueve", 1999.to_words
    assert_equal "dos mil novecientos", 2900.to_words
    assert_equal "mil veintiuno", 1021.to_words

    assert_equal "seiscientos sesenta y tres mil", 663000.to_words
    assert_equal "ochocientos setenta y seis mil", 876000.to_words
    assert_equal "quinientos sesenta y ocho mil", 568000.to_words
    assert_equal "quinientos dos mil", 502000.to_words
    assert_equal "trescientos cuarenta y seis mil", 346000.to_words

    assert_equal "seiscientos sesenta y tres mil setecientos cuarenta y seis",
      663746.to_words
    assert_equal "ocho mil setecientos sesenta y ocho", 8768.to_words
    assert_equal "cincuenta y seis mil ochocientos treinta y seis", 56836.to_words
    assert_equal "quinientos dos mil ciento veintitres", 502123.to_words
    assert_equal "novecientos cuarenta y seis mil novecientos ochenta y siete", 946987.to_words

    assert_equal "un millon seiscientos sesenta y tres mil setecientos cuarenta y seis",
      1663746.to_words
    assert_equal "cinco millones ocho mil setecientos sesenta y ocho", 5008768.to_words
    assert_equal "diez millones cincuenta y seis mil ochocientos treinta y seis", 10056836.to_words
    assert_equal "trescientos cuarenta millones quinientos dos mil ciento veintitres", 340502123.to_words
    assert_equal "novecientos millones", 900000000.to_words
  end
end
