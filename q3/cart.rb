require './base.rb'

module Q3
  class Cart < Base
    attr_reader :total_price
    def initialize
      @products = []
      @total_price = 0
    end

    def add(product)
      @products << product
    end

    def calc_total_price(campaigns = nil)
      product_count = 0
      prices = @products.map do |shopping_list|
        product_count += shopping_list[:count]
        shopping_list[:product].price * shopping_list[:count]
      end

      discout_price = 0
      campaigns.each { |campaign| discout_price += campaign.apply(product_count).to_i } if !campaigns.nil?

      @total_price = prices.sum - discout_price
    end
  end
end
