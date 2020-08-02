require_relative 'night_writer'
require_relative 'alphabet_hash'

class Encrypt
  include AlphabetHash

  attr_reader :alphabet,
              :line1,
              :line2,
              :line3,
              :night_writer,
              :all_lines

  def initialize
    @alphabet = AlphabetHash.alphabet_hash
    @line1 = []
    @line2 = []
    @line3 = []
    @night_writer = NightWriter.new
  end

  # def encrypt_file
  #   english = @night_writer.read.chomp
  #   binding.pry
  #   braille = translate(english)
  #   @night_writer.write(braille)
  # end

  def translate(letter)
    letters = letter.chars
    arrays = letters.map do |letter|
      @alphabet[letter]
    end
    grid_format(arrays)
  end

  def grid_format(arrays)
    arrays.map do |array|
      @line1 << array[0]
      @line2 << array[1]
      @line3 << array[2]
    end
    format_lines
  end

  def format_lines
    line_1_as_string = line1.join('')
    line_2_as_string = line2.join('')
    line_3_as_string = line3.join('')
    @all_lines = [line_1_as_string, line_2_as_string, line_3_as_string]
    @all_lines.join("\n")
  end
end
