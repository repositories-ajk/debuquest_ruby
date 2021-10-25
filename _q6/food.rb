require "./q6/menu"

module Q6
  class Food < Menu
    attr_accessor :calorie

    def initialize(name:, price:, calorie:)
      super(name: name, price: price)
      @calorie = calorie
    end
  end
end
