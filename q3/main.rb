require './base.rb'
require './q3/cart'
require './q3/product'
require './q3/user'

module Q3
  class Main < Base
    def self.execute
      Product.seed

      user = User.new(1000)

      user.shopping
      user.judge_product_buy

    end
  end
end
