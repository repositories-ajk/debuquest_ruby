require './base.rb'

module Q3
  class Cart < Base
    attr_reader :total_price
    def initialize
      @menus = []
      @total_price = 0
    end

    def add(menu)
      @menus << menu
    end

    def calc_total_price(campaigns = nil)
      menu_count = 0
      prices = @menus.map do |shopping_list|
        menu_count += shopping_list[:count]
        shopping_list[:menu].price * shopping_list[:count]
      end

      discout_price = 0
      campaigns.each { |campaign| discout_price += campaign.apply(menu_count).to_i } if !campaigns.nil?

      @total_price = prices.sum - discout_price
    end
  end
end
