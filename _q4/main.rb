require './base.rb'
require './q4/zip_client.rb'
require './q4/validation_error.rb'

module Q4
  class Main < Base
    def self.execute
      begin
        puts '郵便番号を入力してください'
        input_value = gets.chomp

        full_address = ZipClient.get_full_address(input_value)

        puts '入力された郵便番号の住所は'
        puts "#{full_address} です"
      rescue ValidationError
        puts '正しい郵便番号を入力してください'
      end
    end
  end
end