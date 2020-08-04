require './test/test_helper'
require './lib/encrypt'

class EncryptTest < Minitest::Test
  def setup
    @encrypt = Encrypt.new
  end

  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_it_has_the_braille_alphabet
    expected = { "a" => ['0.','..','..'],
      "b" => ['0.','0.','..'],
      "c" => ['00','..','..'],
      "d" => ['00','.0','..'],
      "e" => ['0.','.0','..'],
      "f" => ['00','0.','..'],
      "g" => ['00','00','..'],
      "h" => ['0.','00','..'],
      "i" => ['.0','0.','..'],
      "j" => ['.0','00','..'],
      "k" => ['0.','..','0.'],
      "l" => ['0.','0.','0.'],
      "m" => ['00','..','0.'],
      "n" => ['00','.0','0.'],
      "o" => ['0.','.0','0.'],
      "p" => ['00','0.','0.'],
      "q" => ['00','00','0.'],
      "r" => ['0.','00','0.'],
      "s" => ['.0','0.','0.'],
      "t" => ['.0','00','0.'],
      "u" => ['0.','..','00'],
      "v" => ['0.','0.','00'],
      "w" => ['.0','00','.0'],
      "x" => ['00','..','00'],
      "y" => ['00','.0','00'],
      "z" => ['0.','.0','00'],
      "!" => ['..','00','0.'],
      "'" => ['..','..','0.'],
      "," => ['..','0.','..'],
      "-" => ['..','..','00'],
      "." => ['..','00','.0'],
      "?" => ['..','0.','00'],
      "caps" => ['..','..','.0'],
      " " => ['..','..','..'],
      '#' => ['.0','.0','00']
    }
    assert_equal expected, @encrypt.alphabet
  end

  # def test_it_can_encrypt_file
  #   skip
  #   assert_equal [], @encrypt.encrypt_file
  # end

  def test_it_can_translate
    assert_equal "0.\n..\n..",
    @encrypt.translate("a")

    expected = "0.0.0..0.0.000\n......0.000..0\n....000.0...0."

    assert_equal expected,
    @encrypt.translate("austin")
  end

  def test_it_returns_in_grid_form
    array = [['0.','..','..'], ['0.','..','00'], ['.0','0.','0.'],
    ['.0','00','0.'], ['.0','0.','..'], ['00','.0','0.']]

    assert_equal "0.0..0.0.000\n....0.000..0\n..000.0...0.",
    @encrypt.grid_format(array)
  end

  def test_it_can_format_80_character_limit
    @encrypt.translate("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n\n\n"
    assert_equal expected, @encrypt.character_limit
  end
end
