# Método que define um atributo com histórico
class Class
  def attr_accessor_with_history(attr_name)
    # Converte o nome do atributo para uma string
    attr_name = attr_name.to_s

    # Define um método de leitura para o atributo
    attr_reader attr_name

    # Define um método de leitura para o histórico do atributo
    attr_reader attr_name + "_history"

    # Avalia o código dinamicamente para definir o método de atribuição (setter)
    class_eval %Q{
      # Define o método de atribuição para o atributo
      def #{attr_name}=(value)
        # Atribui o valor ao atributo de instância
        @#{attr_name} = value

        # Inicializa o histórico do atributo, caso ainda não exista
        if @#{attr_name + "_history"}.nil?
          @#{attr_name + "_history"} = [nil] # Inicializa com [nil] como valor inicial
        end

        # Adiciona o novo valor ao histórico
        @#{attr_name + "_history"}.push(value)
      end
    }
  end
end

# Classe de exemplo para testar o método attr_accessor_with_history
class Foo
  # Cria o atributo :bar com histórico usando o método personalizado
  attr_accessor_with_history :bar
end

# Cria uma nova instância de Foo e altera o valor de bar
f = Foo.new
f.bar = 1           # Atribui o valor 1 a bar
f.bar = 2           # Atribui o valor 2 a bar
puts f.bar_history.inspect # Exibe o histórico de bar: [nil, 1, 2]

# Cria uma nova instância de Foo e altera o valor de bar
f = Foo.new
f.bar = 4           # Atribui o valor 4 a bar
puts f.bar_history.inspect # Exibe o histórico de bar: [nil, 4]