require './base.rb'

module Q1
  class Method < Base
    def self.execute
      puts "お名前を入力してください"
      name = set_name

      return puts "文字列で入力してください" if Method.get_string?(name)

      puts disp_name(name)
    end

    def self.disp_name(naem)
      "#{@name}さん、こんにちわ！！"
    end

    def self.set_name
      self.name = gets.chomp

      name
    end

    def self.get_string?(target)
      target.is_a?(String)
    end
  end
end
