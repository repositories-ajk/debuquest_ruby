module Q9::SelectUtil
  def self.continue(select_range)
    begin
      input_value = gets.chomp
      raise if select_range.include?(input_value)
    rescue
      puts "選択できない番号です"
      retry
    end
  end
end
