require "./base.rb"

class Q4::Calc < Base
  def self.twice(numbers)
    numbers.map {|number| number * 2}
  end
end
