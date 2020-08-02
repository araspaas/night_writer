require_relative 'night_writer'
require_relative 'alphabet_hash'

class Encrypt
  include AlphabetHash

  attr_reader :alphabet,
              :line1,
              :line2,
              :line3,
              :night_writer

  def initialize
    @alphabet = AlphabetHash.alphabet_hash
    @line1 = []
    @line2 = []
    @line3 = []
    @night_writer = NightWriter.new
  end

  def translate(letter)
    letters = letter.chars
    letters.map do |letter|
      @alphabet[letter]
    end
  end

  def grid_format(arrays)
    arrays.map do |array|
      @line1 << array[0]
      @line2 << array[1]
      @line3 << array[2]
    end
  end
end
