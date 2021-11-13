require "pry"
require "./q0/main"
require "./q1/main"
require "./q2/main"
require "./q3/main"
require "./q4/main"
require "./q5/main"
require "./q6/main"
require "./q7/main"
require "./q8/main"
require "./q9/main"

class Execution
  QUESTION_NUMS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  # ここから下は絶対触らないでね！(あじーより)
  def self.call
    puts "挑戦する問題番号を入力してください！！"

    question_number = gets.chomp.to_i
    validate_msg = validate(question_number)
    return puts validate_msg if !!validate_msg

    klass = Object.const_get("Q#{question_number}::Main")
    klass.execute
  end

  def self.validate(num)
    return "存在しない問題番号です" if !QUESTION_NUMS.include?(num)
    return "半角数字で入力してください" if !num.is_a?(Integer)

    nil
  end
  private_class_method :validate
end


Execution.call
