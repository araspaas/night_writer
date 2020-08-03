class FileInputOutput

  def read
    filename = ARGV[0]
    File.read(filename)
  end

  def write(translation)
    filename = ARGV[1]
    encrypted_text = File.open(filename, "w")
    encrypted_text.write(translation)
    encrypted_text.close
    read_encrypted = File.open(filename, "r")
    number_of_characters = (read_encrypted.read.length) - 1
    puts "Created '#{ARGV[1]}' containing #{number_of_characters} characters"
  end
end
