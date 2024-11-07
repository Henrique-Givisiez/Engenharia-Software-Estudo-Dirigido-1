# Extende a classe Numeric para adicionar funcionalidades de conversão de moeda
class Numeric
  # Define uma variável de classe com taxas de câmbio para algumas moedas
  @@currencies = { 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1 }

  # Define o método `method_missing` para capturar chamadas de métodos não definidos
  def method_missing(method_id)
    # Converte o nome do método para string e remove o 's' do final para obter o singular
    singular_currency = method_id.to_s.gsub(/s$/, '')

    # Verifica se a moeda está definida em @@currencies
    if @@currencies.has_key?(singular_currency)
      # Se existir, multiplica o valor numérico pela taxa de câmbio da moeda correspondente
      self * @@currencies[singular_currency]
    else
      # Caso contrário, chama `super` para lidar com o método ausente de maneira padrão
      super
    end
  end

  # Define o método `in` para converter a moeda atual para outra
  def in(currency)
    # Converte o argumento para string e remove o 's' do final para obter o singular
    singular_currency = currency.to_s.gsub(/s$/, '')

    # Divide o valor numérico pela taxa de câmbio da moeda alvo para obter a conversão
    self / @@currencies[singular_currency]
  end
end


# Converte 5 dollars para euros usando a taxa de câmbio definida
puts 5.dollars.in(:euros)   # Saída esperada: aproximadamente 3.87

# Converte 10 euros para rupees usando as taxas de câmbio definidas
puts 10.euros.in(:rupees)   # Saída esperada: aproximadamente 680.42


class String
  # Verifica se a string é um palíndromo
  def palindrome?
    # Remove caracteres não alfanuméricos, converte para minúsculas e compara com a versão invertida
    processed_content = self.gsub(/\W/, '').downcase
    processed_content == processed_content.reverse
  end
end

puts "A man, a plan, a canal, Panama".palindrome?   # Saída: true
puts "Hello, world!".palindrome?                   # Saída: false

class Array
  # Define o método `palindrome?` para verificar se um array é um palíndromo
  def palindrome?
    # Remove elementos nulos e compara com a versão invertida
    self.compact == self.compact.reverse
  end
end

puts [1, 2, 3, 2, 1].palindrome?   # Saída: true
puts [1, 2, 3, 4, 5].palindrome?   # Saída: false
puts [1, 2, 3, nil, 3, 2, 1].palindrome?   # Saída: true