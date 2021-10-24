require './base.rb'
require './q3/select_util.rb'

module Q3
  class Product < Base
    @@list = []

    attr_reader :name, :price

    def initialize(name:, price:)
      @name = name
      @price = price
    end

    def self.seed
      seed_list = [
        { name: 'りんご', price: 150 },
        { name: 'みかん', price: 100 },
        { name: 'コーラ', price: 160},
        { name: 'レモンサワー', price: 500 },
        { name: '焼き鳥', price: 80 }
      ]

      @@list = seed_list.map { |list| new(list) }
    end

    def self.disp_list
      puts '商品リスト'
      puts '-------------------'
      @@list.each.with_index(1){ |product, i| puts "No.#{i}. 商品名: #{product.name} (#{product.price}円)"}
      puts '-------------------'
    end

    def self.choose
      product_size = @@list.size

      puts '商品を選んでください'

      input_value = SelectUtil.continue(1..product_size)
      select_num = input_value - 1
      choose_product = { product: @@list[select_num] }

      puts '個数を入力してください'

      input_value = gets.chomp.to_i
      choose_count = { count: input_value }

      choose_product.merge(choose_count)
    end
  end
end
