require "date"

class Q7::Menu
  attr_accessor :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def info
    "#{name} #{price}円"
  end

  def total_price(count)
    total_price = price * count
    total_price = discount_price(count)
    total_price
  end

  private

    def discount_price(count)
      discount_price = 0
      discount_price -= 100 if count >= 3
      discount_price -= 100 if is_discount_day?
      discount_price
    end

    def is_discount_day?
      today = Date.today
      # 問題を解いている本日の曜日であればディスカウントの曜日判定になるように修正しましょう
      false
    end
end
