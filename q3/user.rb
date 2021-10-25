require './base.rb'

# ユーザー情報統合
class MergeInfo
  def info
    name = "木村"
    id = "123abc"
    password = "pass123"
    country = "japan"
    age = 30

    # ユーザー基本情報格納
    base_info = {
      name: name,
      id: id,
      password: password
    }

    # ユーザー詳細情報格納
    detail_info = {
      country: country,
      age: age
    }
  end

  def merge
    userinfo = @base_info.merge(@detail_info)
    res_id = userinfo[:id]
    puts res_id
  end
end

mergeinfo = MergeInfo.new
mergeinfo.info
mergeinfo.merge
