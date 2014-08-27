class Pizza

  attr_accessor :toppings

  def initialize(toppings = [Topping.new("cheese")] )
    @toppings = toppings
  end

  def vegetarian?()
    toppings.all? {|x| x.vegetarian == true}
  end

end

class Topping

  attr_accessor :name, :vegetarian

  def initialize(name, vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end

end
