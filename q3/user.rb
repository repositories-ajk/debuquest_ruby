require './base.rb'
require './q3/select_util.rb'

module Q3
  class User < Base
    attr_reader :cart

    def initialize(money)
      @money = money
      @cart = Cart.new
    end

    def add_cart(product)
      cart.add(product)
    end

    def judge_product_buy(campaigns)
      if can_buy_product?(campaigns)
        @money -= cart.total_price
        puts "お買い上げありがとうございました！"
        disp_info(column: '合計金額', value: cart.total_price)
        disp_info(column: '残金', value: @money)
      else
        puts "所持金が足りません"
        disp_info(column: '合計金額', value: cart.total_price)
        disp_info(column: '所持金', value: @money)
      end
    end

    def shopping
      while true
        Product.disp_list
        product = Product.choose

        cart.add(product)

        break unless continue_shopping?
      end
    end

    def disp_info(column:, value:)
      puts "#{column}: #{value}"
    end

    private

    def continue_shopping?
      continue = 1

      puts '買い物を続けますか？'
      puts '-----------------'
      puts '1. 続ける'
      puts '2. お会計をする'
      puts '-----------------'
      puts '番号を選んでください'

      input_value = SelectUtil.continue(1..2)

      continue == input_value
    end

    def can_buy_product?(campaigns)
      cart.calc_total_price(campaigns)
      @money >= cart.total_price
    end
  end
end
