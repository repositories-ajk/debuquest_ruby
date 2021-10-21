require './base.rb'
require './q3/select_util.rb'

module Q3
  class User < Base
    attr_reader :money, :cart

    def initialize(money)
      @money = money
      @cart = Cart.new
    end

    def add_cart(product)
      cart.add(product)
    end

    def judge_product_buy
      if can_buy_product?
        puts "お買い上げありがとうございました！"
      else
        puts "所持金が足りません"
      end
    end

    def can_buy_product?
      money >= cart.total_price
    end

    def shopping
      while true
        Product.disp_list
        product = Product.choose

        cart.add(product)

        break unless continue_shopping?
      end
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
  end
end
