require './base.rb'

module Q3
  class Campaign < Base
    def initialize(name:, discout_price:, count: nil, day_of_week: nil)
      @name = name
      @discout_price = discout_price
      @count = count
      @day_of_week = day_of_week
    end

    def apply(product_count)
      today = Date.today
      return if !!@day_of_week && !today.public_send("#{@day_of_week}?")
      return if !!@count && product_count < @count

      @discout_price
    end
  end
end
