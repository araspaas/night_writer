require './test/test_helper'
require './lib/braille_alphabet'

class BrailleAlphabetTest < Minitest::Test
  def setup
    @braille_alphabet = BrailleAlphabet.new
  end

  def test_it_exists
    assert_instance_of BrailleAlphabet, @braille_alphabet
  end

  def test_it_has_the_braille_alphabet
    expected = @alpha_to_braille = { "a" => ['0.','..','..'],
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
    assert_equal expected, @braille_alphabet.alphabet
  end

  def test_it_can_translate
    assert_equal [['0.','..','..']],
    @braille_alphabet.translate("a")
  end
end
