require './test/test_helper'
require './lib/braille_alphabet'

class BrailleAlphabetTest < Minitest::Test
  def setup
    @braille_alphabet = BrailleAlphabet.new
  end

  def test_it_exists
    assert_instance_of BrailleAlphabet, @braille_alphabet
  end
end
