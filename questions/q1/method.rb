require './base.rb'

module Questions
  module Q1
    class Method < Base
      class << self

        def disp_name(naem)
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
