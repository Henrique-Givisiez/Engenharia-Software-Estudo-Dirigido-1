class Dessert
    # metodo para inicializar a classe 
    def initialize(name, calories)
      # variaveis de instancia
      @name = name 
      @calories = calories
    end

    def healthy?
      # retorna true se calorias for menor que 200
      return @calories < 200
    end

    def delicious?
      # retorna true sempre
      return true
    end
end

class JellyBean < Dessert
    # metodo para inicializar classe
    def initialize(name, calories, flavor)
      super(name, calories) # herda variaveis de instancia da classe pai "Dessert"
      @flavor = flavor     
    end

    def delicious?
      # retorna false se  o sabor da sobremesa for "black licorice". Caso contrario
      # retorna true
      return @flavor != "black licorice"
    end
end
    

# Teste 1
petit_gateau = Dessert.new("petit gateau", 300)
puts petit_gateau.healthy?
puts petit_gateau.delicious?


# Teste 2
gelatina = JellyBean.new("gelatina", 300, "black licorice")
puts gelatina.healthy?
puts gelatina.delicious?
