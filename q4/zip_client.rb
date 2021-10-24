require './q4/base_api_client.rb'

module Q4
  module ZipClient
    BASE_URL = 'https://api.zipaddress.net/'

    def self.get_full_address(zipcode)
      return raise unless validate_zipcode(zipcode)

      params = { zipcode: zipcode }
      res = call(params)

      result = if !res.body['data'].nil?
                 res.body["data"]["fullAddress"]
               else
                 '不明な住所'
               end

      result
    end

    def self.call(params = nil)
      BaseApiClient.get_connection(BASE_URL, params)
    end
    private_class_method :call

    def self.validate_zipcode(value)
      code_regex = /^[0-9]{3}-?[0-9]{4}$/

      value =~ code_regex
    end
  end
end