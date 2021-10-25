require "./q6/menu"

module Q6
  class Drink < Menu
    attr_accessor :amount

    def initialize(name:, price:, amount:)
      super(name: name, price: price)
      @amount = amount
    end
  end
end
