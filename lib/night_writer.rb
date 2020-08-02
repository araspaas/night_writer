# class NightWriter
#
#   def read
#     filename = ARGV[0]
#     File.read(filename)
#   end
#
#   def write(translation)
#     filename = ARGV[1]
#     encrypted_text = File.open(filename, "w")
#     encrypted_text.write(translation)
#     encrypted_text.close
#     read_encrypted = File.open(filename, "r")
#     number_of_characters = (read_encrypted.read.length) - 1
#     puts "Created '#{ARGV[1]}' containing #{number_of_characters} characters"
#   end
# end
file = File.open(ARGV[0],"r")

incoming_text = file.read

file.close

translated_text = incoming_text.upcase

writer = File.open(ARGV[1],"w")

writer.write(translated_text)

writer.close

read_new = File.open(ARGV[1],"r")

number_of_characters = read_new.read.length - 1

puts "Created '#{ARGV[1]}' containing #{number_of_characters} characters"
