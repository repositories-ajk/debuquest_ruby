require "./q6/food"
require "./q6/drink"

module Q6
  class Main < Base
    def self.execute
      begin
        food1 = Food.new(name: "焼き鳥", price: 800, calorie: 700)
        food2 = Food.new(name: "モツ煮込み", price: 1000, calorie: 600)
        drink1 = Drink.new(name: "ビール", price: 400, amount: 500)
        drink2 = Drink.new(name: "レモンサワー", price: 280, amount: 400)

        menus = [food1, food2, drink1, drink2]

        puts "月曜日は全品100円引き！"
        puts "--------------"

        menus.each.with_index(1) do |menu, i|
          puts "#{i}. #{menu.info}"
        end

        puts "--------------"
        puts "メニューの番号を選択してください"
        input_value = gets.chomp.to_i

        selected_num = input_value - 1

        selected_menu = menus[selected_num]
        puts "選択されたメニュー: #{selected_menu.name}"

        puts "個数を入力してください(3つ以上頼むと100円引き！)"
        input_value = gets.chomp.to_i

        total_price = selected_menu.get_total_price(input_value)

        puts "お会計は#{total_price}円です"
      rescue
        puts '不正な値です。'
      end
    end
  end
end
