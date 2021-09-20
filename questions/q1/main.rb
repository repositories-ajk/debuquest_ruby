require './base.rb'

module Questions
  module Q1
    class Main < Base
      class << self
        def execute
          puts "お名前を入力してください"
          name = set_name

          return puts "文字列で入力してください" if get_string?(name)

          puts disp_name(name)
        end

        def disp_name(name)
          "#{@name}さん、こんにちわ！！"
        end

        def set_name
          name = gets.chomp

          name
        end

        def get_string?(target)
          target.is_a?(String)
        end
      end
    end
  end
end
