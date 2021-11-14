require "./base.rb"

class Q9::Cart < Base
  attr_reader :total_price
  def initialize
    @menus = []
    @total_price = 0
  end

  def add(menu)
    @menu = menu
  end

  def calc_total_price(campaigns = nil)
    prices = @menus.map do |shopping_list|
      shopping_list[:menu].price * shopping_list[:count]
    end

    discout_price = 0
    campaigns.each { |campaign| discout_price += campaign.apply(menu_count).to_i } if campaigns.nil?

    prices.sum - discout_price
  end
end
