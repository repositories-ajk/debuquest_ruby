require './base.rb'

# ユーザー情報統合
class Q3::MergeInfo
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
    user_info = base_info.merge(detail_info)
    user_id = user_info[:id]
    puts user_id
  end
end
