require_relative 'file_input_output'
require_relative 'alphabet_hash'

class Decrypt
  include AlphabetHash
  attr_reader :alphabet,
              :line1,
              :line2,
              :line3,
              :line1_braille,
              :line2_braille,
              :line3_braille,
              :braille_letters,
              :file_input_output

  def initialize
    @alphabet = AlphabetHash.alphabet_hash.invert
    @file_input_output = FileInputOutput.new
    @line1 = []
    @line2 = []
    @line3 = []
    @line1_braille = []
    @line2_braille = []
    @line3_braille = []
    @braille_letters = []
  end

  def decrypt_file
    braille = @file_input_output.read.chomp
    english = decrypt_to_english(braille)
    @file_input_output.write(english)
  end

  def decrypt_to_english(input)
    parse_braille_lines(input)
  end

  def parse_braille_lines(input)
    @line1, @line2, @line3 = input.split("\n")
    format_braille_keys
  end

  def format_braille_keys
    @line1_braille = line1.scan(/../)
    @line2_braille = line2.scan(/../)
    @line3_braille = line3.scan(/../)
    index = 0
    until index > line1_braille.length - 1
      @braille_letters << [line1_braille[index], line2_braille[index], line3_braille[index]]
      index +=1
    end
    translate_to_english
  end

  def translate_to_english
    @braille_letters.map do |letter|
      @alphabet[letter]
    end.join
  end
end
