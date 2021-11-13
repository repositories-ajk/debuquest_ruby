require "./base.rb"
require "./q9/select_util.rb"

class Q9::User < Base
  attr_reader :cart

  def initialize(money)
    @money = money
    @cart = Q9::Cart.new
  end

  def add_cart(menu)
    cart.add(menu)
  end

  def judge_menu_buy(campaigns)
    if can_buy_menu?(campaigns)
      @money -= cart.total_price
      puts "お買い上げありがとうございました！"
      disp_info(column: "合計金額", value: cart.total_price)
      disp_info(column: "残金", value: @money)
    else
      puts "所持金が足りません"
      disp_info(column: "合計金額", value: cart.total_price)
      disp_info(column: "所持金", value: @money)
    end
  end

  def shopping
    while true
      Q9::Menu.disp_list
      menu = Q9::Menu.choose

      cart.add(menu)

      break unless continue_shopping?
    end
  end

  def disp_info(column:, value:)
    puts "#{column}: #{value}"
  end

  private

  def continue_shopping?
    continue = 1

    puts "買い物を続けますか？"
    puts "-----------------"
    puts "1. 続ける"
    puts "2. お会計をする"
    puts "-----------------"
    puts "番号を選んでください"

    input_value = Q9::SelectUtil.continue(1..2)

    continue == input_value
  end

  def can_buy_menu?(campaigns)
    cart.calc_total_price
    @money >= cart.total_price
  end
end
