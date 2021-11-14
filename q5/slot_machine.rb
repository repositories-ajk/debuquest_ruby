class Q5::SlotMachine
  def rotate
    puts "「y」 キーを押してスロットマシーンを回してください！"

    begin
      input_key = gets.chomp

      raise unless input_key == "y"
    rescue
      puts "「y」キーを押してください"
      retry
    end
  end

  def check_numbers(number1:, number2:, number3:)
    same_numbers_count = count_same_numbers(number1: number1, number2: number2, number3: number3)
    puts "結果: |#{number1}|#{number2}|#{number3}|"
    case same_numbers_count
    when 1
      puts "残念！ハズレ！"
    when 2
      puts "惜しい！"
    when 3
      puts "大当たり！"
    end
  end

  private

    def count_same_numbers(number1:, number2:, number3:)
      same_numbers_count = if (number1 == number2 && number1 == number3)
                            2
                          elsif number1 == number2 || number1 == number3 || number2 == number3
                            1
                          else
                            0
                          end
      same_numbers_count
    end
end
