require "date"

class Q7::Menu
  attr_accessor :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def info
    text = "#{name} #{price}円"
  end

  def total_price(count)
    total_price = price * count
    total_price = discount(total_price: total_price, count: count)
    total_price
  end

  private

    def discount(total_price:, count:)
      total_price -= 100 if count >= 3
      total_price -= 100 if is_discount_day?
      total_price
    end

    def is_discount_day?
      today = Date.today
      today.sunday?
    end
end
