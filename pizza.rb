class Pizza
  
  attr_accessor :toppings

  def initialize(toppings)
    @toppings = toppings

  end

end

class Topping

  attr_accessor :name, :vegetarian

  def initialize(name, vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end

end
