require 'pry'
require './questions/q1/main'

class Execution
  QUESTION_NUMS = [1]

  class << self
    def Q1
      Questions::Q1::Main.execute
    end

    def validate(num)
      return "存在しない問題番号です" if !QUESTION_NUMS.include?(num)
      return "半角数字で入力してください" if !num.is_a?(Integer)

      nil
    end

    def call
      puts "挑戦する問題番号を入力してください！！"

      q_num = gets.chomp.to_i

      validate_msg = validate(q_num)

      return puts validate_msg if !!validate_msg

      Execution.public_send("Q#{q_num}")
    end
  end
end


Execution.call
