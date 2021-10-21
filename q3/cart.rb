require './base.rb'

module Q3
  class Cart < Base
    def initialize
      @products = []
    end

    def add(product)
      @products << product
    end

    def total_price
      prices = @products.map { |list| list[:product].price * list[:count] }
      prices.sum
    end
  end
end
