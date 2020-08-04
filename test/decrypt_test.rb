require './test/test_helper'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def setup
    @decrypt = Decrypt.new
  end

  def test_it_exists
    assert_instance_of Decrypt, @decrypt
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
    assert_equal expected, @decrypt.alphabet.invert
  end

  def test_it_can_decrypt
    skip
    # I feel like i can't test this.
    # maybe a mock or stub could be used
  end

  def test_it_can_split_lines
    expected1 = "0.0.0.0.0....00.0.0.00..0."
    expected2 = "00.00.0..0..00.0000..0..00"
    braille = "0.0.0.0.0....00.0.0.00..0.\n00.00.0..0..00.0000..0..00\n....0.0.0....00.0.0..."
    assert_equal "hello world", @decrypt.parse_braille_lines(braille)
  end

  def test_it_can_split_braille_into_chunks
    expected1 = ["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00", "..", "0."]
    expected2 = ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]
    braille = "0.0.0.0.0....00.0.0.00..0.\n00.00.0..0..00.0000..0..00\n....0.0.0....00.0.0..."
    assert_equal "hello world", @decrypt.parse_braille_lines(braille)
    assert_equal expected1, @decrypt.line1_braille
    assert_equal expected2, @decrypt.line3_braille
  end

  def test_format_braille_keys
    expected = [["..", "..", ".0"], ["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."], ["..", "..", ".."], ["..", "..", ".0"], [".0", "00", ".0"], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."], ["00", ".0", ".."], ["..", "..", ".."], ["0.", "00", ".."], [".0", "0.", ".."]]
    braille = "..0.0.0.0.0......00.0.0.00..0..0\n..00.00.0..0....00.0000..0..000.\n.0....0.0.0....0.00.0.0........."
    @decrypt.parse_braille_lines(braille)
    assert_equal expected, @decrypt.braille_letters
  end

  def test_translate_to_english
    braille = "0.0.0.0.0....00.0.0.00..0.\n00.00.0..0..00.0000..0..00\n....0.0.0....00.0.0..."
    @decrypt.parse_braille_lines(braille)
    assert_equal "hello world", @decrypt.translate_to_english
  end
end
