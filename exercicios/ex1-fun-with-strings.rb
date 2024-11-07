def palindrome?(string)
    string = string.downcase.gsub(/[^a-z0-9]/, '')  # remove caracteres não alfanuméricos
    string == string.reverse                        # verifica se a string é igual a ela mesma invertida
end

puts palindrome?("A man, a plan, a canal -- Panama") # true
puts palindrome?("Madam, I'm Adam!")                 # true
puts palindrome?("Abracadabra")                      # false 
puts palindrome?("")                                 # true (nil is also ok)     
puts palindrome?("A Toyota's a toyota")              # true

def count_words(string)
    string = string.downcase.gsub(/[^a-z0-9 ]/, '')  # remove caracteres não alfanuméricos
    words = string.split(/\s+/)                      # separa as palavras
    count = Hash.new(0)                              # cria um hash para contar as palavras
    words.each do |word| count[word] += 1 end           # conta as palavras
    count
end

puts count_words("A man, a plan, a canal -- Panama")  # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
puts count_words("Doo bee doo bee doo") # => {'doo' => 3, 'bee' => 2}
