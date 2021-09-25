require './base.rb'

module Q0
  class Method < Base
    class << self

      def execute
        puts "好きな数字を入力してください"
        num_1 = gets.chomp

        puts "もう一度数字を入力してください"
        num_2 = gets.chomp

        puts "足し算します"

        sum = (num_1 + num_2)

        puts sum
      end

    end
  end
end
