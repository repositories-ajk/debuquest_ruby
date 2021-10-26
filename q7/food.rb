require "./q7/menu"

class Q7::Food < Q7::Menu
  attr_accessor :calorie

  def initialize(name:, price:, calorie:)
    super(name: name, price: price)
    @calorie = calorie
  end
end
