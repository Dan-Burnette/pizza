require './pizza'

describe Pizza do

  it "exists" do
    expect(Pizza).to be_a(Class)
  end

  describe '.initialize' do

    it 'records all of the toppings' do
      toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni')
      ]
      pizza = Pizza.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end

    it 'defaults the toppings to cheese only, if the pizza has no toppings' do
      pizza = Pizza.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end

  end

  #My vegetarian? test
  describe '.vegetarian?' do 

    it 'returns true if all of the toppings on the pizza are vegetarian, false otherwise' do
      veg_toppings = [
          Topping.new('mushrooms', vegetarian: true),
          Topping.new('cheese', vegetarian: true),
          Topping.new('plants', vegetarian: true)
      ]
      veg_pizza = Pizza.new(veg_toppings)

      non_veg_toppings = [
          Topping.new('pepperoni', vegetarian: false),
          Topping.new('sausage', vegetarian: false),
          Topping.new('anchovies', vegetarian: false)
      ]
      non_veg_pizza = Pizza.new(non_veg_toppings)

      expect(veg_pizza.vegetarian?).to eq(true)
      expect(non_veg_pizza.vegetarian?).to eq(false)
    end

  end

  describe '.add_topping' do

    it 'takes a Topping and adds it to the @toppings array' do
      test_pizza = Pizza.new [Topping.new('cheese', vegetarian: true),
                              Topping.new('pepperoni', vegetarian: false)]
      starting_ingredients = test_pizza.toppings.size()
      bacon = Topping.new('bacon', vegetarian: false)

      test_pizza.add_topping(bacon)

      expect(test_pizza.toppings.includes?(bacon)).to eq (true)
      expect(test_pizza.toppings.size()).to eq(starting_ingredients + 1)
    end
  end

end

describe Topping do

  it "exists" do
    expect(Topping).to be_a(Class)
  end

  describe '.initialize' do

    it "sets the name of the topping" do
      topping = Topping.new('olives')

      expect(topping.name).to eq('olives')
    end

    it 'sets whether or not the topping is vegetarian' do
      topping = Topping.new('bell peppers', vegetarian: true)

      expect(topping.vegetarian).to eq(true)
    end
  
end

end
