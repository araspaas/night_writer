class BrailleAlphabet
  attr_reader :alphabet,
              :line1,
              :line2,
              :line3

  def initialize
    @alphabet = @alpha_to_braille =
    { "a" => ['0.','..','..'],
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
    @line1 = []
    @line2 = []
    @line3 = []
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

braille_alphabet = BrailleAlphabet.new

puts braille_alphabet.translate("austin")
puts braille_alphabet.line1
puts braille_alphabet.line2
puts braille_alphabet.line3
