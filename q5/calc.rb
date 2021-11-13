require "./base.rb"

class Q5::Calc < Base

  def self.twice(numbers)
    numbers.map {|number| number * 2}
  end
end
