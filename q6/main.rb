require "./base.rb"
require "./q6/slot_machine.rb"

class Q6::Main < Base
  def self.execute
    slot_machine = SlotMachine.new
    slot_machine.rotate

    numbers = [1, 3, 5, 7]

    number1 = numbers.sample
    number2 = numbers.sumple
    number3 = numbers.sample

    slot_machine.check_numbers(number1: number1, number2: number2, number3: number3)
  rescue
    puts "エラーが発生しています。どこでエラーしているのか調査しましょう。"
  end
end
