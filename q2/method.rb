require "./base.rb"

class Q2::Method < Base
  def self.execute
    puts "お名前を入力してください"
    name = set_name

    return puts "文字列で入力してください" unless get_string?(name)

    disp_name(name)
  end

  def self.disp_name(naem)
    puts "#{@name}さん、こんにちは！！"
  end
  private_class_method :disp_name

  def self.set_name
    @name = gets.chomp
  end
  private_class_method :set_name

  def self.get_string?(target)
    target.is_a?(String)
  end
  private_class_method :get_string?
end
