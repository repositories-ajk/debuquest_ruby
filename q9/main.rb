require './base.rb'
require './q9/cart'
require './q9/menu'
require './q9/user'
require './q9/campaign'

class Q9::Main < Base
  def self.execute
    Q9::Menu.seed

    user = Q9::User.new(1000)

    campaign_1 = Q9::Campaign.new(name: '3個以上で100円引き！', discout_price: 100, count: 3)

    #MEMO: ご自分が実装される曜日を英語で「day_of_week」に入れてください。(例: 日曜日なら、「day_of_week: 'sunday'」)
    campaign_2 = Q9::Campaign.new(name: '毎週◯曜日は100円引き！', discout_price: 100, day_of_week: 'sunday')
    campaigns = [campaign_1, campaign_2]

    user.shopping
    user.judge_menu_buy(campaigns)
  end
end