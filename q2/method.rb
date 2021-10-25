require './base.rb'

module Q2
  class Method < Base
    def self.execute
      puts "お名前を入力してください"
      name = set_name

      return puts "文字列で入力してください" if get_string?(name)

      disp_name(name)
    end

    def self.disp_name(naem)
      puts "#{@name}さん、こんにちわ！！"
    end
    private_class_method :disp_name

    def self.set_name
      self.name = gets.chomp

      @name
    end
    private_class_method :set_name

    def self.get_string?(target)
      target.is_a?(String)
    end
    private_class_method :get_string?
  end
end
