require_relative 'file_input_output'
require_relative 'alphabet_hash'

class Encrypt
  include AlphabetHash

  attr_reader :alphabet,
              :line1,
              :line2,
              :line3,
              :file_input_output,
              :all_lines

  def initialize
    @alphabet = AlphabetHash.alphabet_hash
    @line1 = []
    @line2 = []
    @line3 = []
    # @all_lines = []
    @file_input_output = FileInputOutput.new
  end

  def encrypt_file
    english = @file_input_output.read.chomp
    braille = translate(english)
    @file_input_output.write(braille)
  end

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
    line_1_as_string = @line1.join('')
    line_2_as_string = @line2.join('')
    line_3_as_string = @line3.join('')
    @all_lines = [line_1_as_string, line_2_as_string, line_3_as_string]
    if line_1_as_string.length > 80
      character_limit
    else
      @all_lines.join("\n")
    end
  end

  def character_limit
    over_80_limit = []
    @all_lines.map do |line|
      line[0..79]
      over_80_limit << line[80..-1]
    end
    @all_lines += over_80_limit
    @all_lines.join("\n")
  end
end
