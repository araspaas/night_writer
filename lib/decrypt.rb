require_relative 'file_input_output'
require_relative 'alphabet_hash'

class Decrypt
  include AlphabetHash
  attr_reader :alphabet

  def initialize
    @alphabet = AlphabetHash.alphabet_hash.invert
  end
end
