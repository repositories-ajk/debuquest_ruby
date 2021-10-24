require './base.rb'
require './q3/cart'
require './q3/menu'
require './q3/user'
require './q3/campaign'

module Q3
  class Main < Base
    def self.execute
      Menu.seed

      user = User.new(1000)

      campaign_1 = Campaign.new(name: '3個以上で100円引き！', discout_price: 100, count: 3)
      campaign_2 = Campaign.new(name: '毎週月曜日は100円引き！', discout_price: 100, day_of_week: 'sunday')
      campaigns = [campaign_1, campaign_2]

      user.shopping
      user.judge_menu_buy(campaigns)
    end
  end
end
