require './base.rb'

module Q1
  class Method < Base
    class << self

      def disp_name(naem)
        "#{@name}さん、こんにちわ！！"
      end

      def set_name
        name = gets.chomp

        name
      end

      def get_string?(target)
        target.is_a?(String)
      end

      def execute
        puts "お名前を入力してください"
        name = set_name

        return puts "文字列で入力してください" if Method.get_string?(name)

        puts disp_name(name)
      end

    end
  end
end
