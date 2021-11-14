require './base.rb'
require './q3/sample_api.rb'

class Q3::Main < Base
  def self.execute
    client = Q3::SampleApi.new
    base_info = client.get_sample_user_info(type: :base)
    detail_info = client.get_sample_user_info(type: :detail)

    user_info = base_info.merge(detail_info)
    result = "対象のユーザーの id は #{user_info["id"]} です。"
    puts result
  end
end
