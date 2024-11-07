def combine_anagrams(words)
    anagramas = {} # Inicializa um hash vazio para armazenar os anagramas
    words.each do |word|
        # Cria uma chave ordenando os caracteres da palavra em ordem alfabética
        chave = word.downcase.split(//).sort.join
        anagramas[chave] ||= [] # Inicializa o array se a chave não existir
        anagramas[chave] << word # Adiciona a palavra ao array correspondente à chave
    end
    anagramas.values # Retorna os valores do hash, que são arrays de anagramas
end

# Testa o método com um array de palavras de exemplo e imprime o resultado
puts combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']).inspect
# => [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]