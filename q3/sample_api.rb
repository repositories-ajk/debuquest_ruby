require './base.rb'

class Q3::SampleApi
  def get_sample_user_info(type: :base)
    id = "123abc"
    name = "木村"
    age = 30
    country = "japan"
    password = "pass123"

    case type.to_sym
    when :base
      {
        id: id,
        name: name,
        age: age,
      }
    when :detail
      {
        country: country,
        password: password
      }
    else
      raise "Invalid type Error!"
    end
  end
end
