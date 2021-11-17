require "pry"
require "./base.rb"
require "./q2/user.rb"

class Q2::Main < Base
  def self.execute
    puts "お名前を入力してください"
    binding.pry
    name = gets.chomp
    is_name_string = name.is_a?(String)
      return puts "文字列で入力してください" unless is_name_string

    user = User.new(name)
    user.self_introduce
  end
end
