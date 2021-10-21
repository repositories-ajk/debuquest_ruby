require "date"

module Q6
  class Menu
    attr_accessor :name, :price

    def initialize(name:, price:)
      @name = name
      @price = price
    end

    def info
      text = "#{self.name} #{self.price}円"

      target_class = self.class.name.split('::').last

      case target_class
      when 'Food'
        sub_text = "(#{calorie}kcal)"
      when 'Drink'
        sub_text = "(#{amount}mL)"
      else
        sub_text = ""
      end

      text + sub_text
    end

    def get_total_price(count)
      total_price = price * count

      discount(total_price, count)

      total_price
    end

    private

    def discount(total_price, count)
      total_price -= 100 if count >= 3
      total_price -= 100 if is_discount_day?
    end

    def is_discount_day?
      today = Date.today
      today.monday?
    end
  end
end
