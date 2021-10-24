require './base.rb'
require './q3/select_util.rb'

module Q3
  class Menu < Base
    @@list = []

    attr_reader :name, :price

    def initialize(name:, price:)
      @name = name
      @price = price
    end

    def self.seed
      seed_list = [
        { name: '焼き鳥', price: 100 },
        { name: 'モツ煮込み', price: 200 },
        { name: 'ビール', price: 400},
        { name: 'レモンサワー', price: 280 }
      ]

      @@list = seed_list.map { |list| new(list) }
    end

    def self.disp_list
      puts "月曜日は全品100円引き！"
      puts "--------------"
      puts '商品リスト'
      puts '-------------------'
      @@list.each.with_index(1){ |menu, i| puts "No.#{i}. 商品名: #{menu.name} (#{menu.price}円)"}
      puts '-------------------'
    end

    def self.choose
      menu_size = @@list.size

      puts '商品を選んでください'

      input_value = SelectUtil.continue(1..menu_size)
      select_num = input_value - 1
      choose_menu = { menu: @@list[select_num] }

      puts '個数を入力してください(3つ以上頼むと100円引き！)'

      input_value = gets.chomp.to_i
      choose_count = { count: input_value }

      choose_menu.merge(choose_count)
    end
  end
end
