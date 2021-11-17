require "./base.rb"

class Q1::Main < Base
  def self.execute
    # -------- 以下編集不可 --------
    animals = ["dog", "cat"]
    output_value(animals)

    empty_array = []
    output_value(empty_array)
    # -------- ここまで --------
  end

  def self.output_value(array)
    # -------- 編集可 --------
    if array.empty?
      puts "配列が空です"
    else
      array.each do |v|
        puts v
      end
    end
    # -------- ここまで --------
  end
end
