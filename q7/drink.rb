require "./q7/menu"

class Q7::Drink < Q7::Menu
  attr_accessor :amount

  def initialize(name:, price:, amount:)
    @name = name
    @price = price
    @amount = amount
  end

  def info
    super
  end
end
