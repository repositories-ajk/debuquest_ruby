module SelectUtil
  def self.continue(select_range)
    begin
      input_value = gets.chomp.to_i
      raise unless [1, 2].include?(input_value)
    rescue
      puts '選択できない番号です'
      retry
    end

    input_value
  end
end