require './base.rb'
require './questions/q1/method'

module Questions
  module Q1
    class Question < Base
      class << self

        def start
          puts "お名前を入力してください"
          name = Method.set_name

          return puts "文字列で入力してください" if Method.get_string?(name)

          puts Method.disp_name(name)
        end

      end
    end
  end
end
