require 'pry'
require './q0/method'
require './q1/method'
require './q2/method'
require './q3/main'
require './q4/main'
require './q5/method'
require './q6/method'
require './q7/main'
require './q8/main'
require './q9/main'

class Execution
  QUESTION_NUMS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  class << self

    # 各問題ごとに実行されるメソッド
    def q0
      Q0::Method.execute
    end

    def q1
      Q1::Method.execute
    end

    def q2
      Q2::Method.execute
    end

    def q3
      Q3::Main.execute
    end

    def q4
      Q4::Main.execute
    end

    def q5
      Q5::Method.execute
    end

    def q6
      Q6::Method.execute
    end

    def q7
      Q7::Main.execute
    end

    def q8
      Q8::Main.execute
    end

    def q9
      Q9::Main.execute
    end

    # ここから下は絶対触らないでね！(あじーより)
    def call
      puts "挑戦する問題番号を入力してください！！"

      q_num = gets.chomp.to_i

      validate_msg = validate(q_num)

      return puts validate_msg if !!validate_msg

      Execution.public_send("q#{q_num}")
    end

    private

    def validate(num)
      return "存在しない問題番号です" if !QUESTION_NUMS.include?(num)
      return "半角数字で入力してください" if !num.is_a?(Integer)

      nil
    end
  end
end


Execution.call
