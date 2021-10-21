require './q4/base_api_client.rb'

module Q4
  module ZipClient
    BASE_URL = 'https://api.zipaddress.net/'

    def self.get_full_address(zipcode)
      params = { zipcode: zipcode }
      res = call(params)

      if !res.body['data'].nil?
        result = res.body["data"]["fullAddress"]
      else
        result = '不明な住所'
      end

      result
    end

    def self.call(params = nil)
      res = BaseApiClient.get_connection(BASE_URL, params)
    end

  end
end