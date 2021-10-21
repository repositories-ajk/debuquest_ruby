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

    class << self

      def list=(list)
        @@list = list
      end

      def list
        @@list
      end

      def seed
        seed_list = [
          { name: 'りんご', price: 150 },
          { name: 'みかん', price: 100 },
          { name: 'コーラ', price: 160},
          { name: 'レモンサワー', price: 500 },
          { name: '焼き鳥', price: 80 }
        ]

        self.list = seed_list.map { |list| new(list) }
      end

      def disp_list
        puts '商品リスト'
        puts '-------------------'
        list.each.with_index(1){ |product, i| puts "No.#{i}. 商品名: #{product.name} (#{product.price}円)"}
        puts '-------------------'
      end

      def choose
        product_size = list.size

        puts '商品を選んでください'

        input_value = SelectUtil.continue(1..product_size)
        choose_product = { product: list[input_value - 1] }

        puts '個数を入力してください'

        input_value = gets.chomp.to_i
        choose_count = { count: input_value }

        choose_product.merge(choose_count)
      end
    end
  end
end
