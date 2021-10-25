require './base.rb'

class Q6::Method < Base

  def self.execute
    puts "「y」 キーを押してスロットマシーンを回してください！"

    begin
      input_key = gets.chomp

      unless input_key == "y"
        raise
      end
    rescue
      puts "「y」キーを押してください"
      retry
    end

    numbers = [1, 3, 5, 7]

    number = numbers.sample
    number2 = numbers.sumple
    number3 = numbers.sample

    Q6::Method.check_numbers(number: number, number2: number2, number3: number3)

  rescue
    puts "エラーが発生しています。どこでエラーしているのか調査しましょう。"
  end


  private

    def self.check_numbers(number:, number2:, number3:)
      same_numbers_count = Q6::Method.count_same_numbers(number: number, number2: number2, number3: number3)
      puts "結果: |#{number}|#{number2}|#{number3}|"
      case same_numbers_count
      when 1
        puts "残念！ハズレ！"
      when 2
        puts "惜しい！"
      when 3
        puts "大当たり！"
      end
    end

    def self.count_same_numbers(number:, number2:, number3:)
      same_numbers_count = if (number == number2 && number == number3)
                            2
                           elsif number == number2 || number == number3 || number2 == number3
                            1
                           else
                            0
                           end
      same_numbers_count
    end
end
